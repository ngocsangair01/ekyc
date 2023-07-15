import 'dart:convert';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:ekyc/utils/keyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:ekyc/routes/app_pages.dart';
import 'application/app_controller.dart';
import 'const/const.dart';

void main() {
  _init();
}

void _init() async {
  await GetStorage.init();
  await checkSDKAbove30();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Application());
  _registerHttpsRequest();
}

String initRoute = '/';

Future<void> checkSDKAbove30() async {
  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    var release = androidInfo.version.sdkInt;
    if (release >= 31) initRoute = '/home';
  }
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.bg(),
        // AppColors.accentColorTheme(ThemeService().theme == ThemeMode.dark),
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light));
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  /// Application
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: KeyBoard.hide,
      child: GetMaterialApp(
        locale: getLocale(),
        fallbackLocale: const Locale('vi', 'VN'),
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        supportedLocales: [const Locale('vi'), const Locale('en')],
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: AppStr.appName,
        getPages: AppPages.route,
        logWriterCallback: localLogWriter,
        initialRoute: initRoute,
        navigatorObservers: [GetBack((_) {}, Get.routing)],
      ),
    );
  }

  void localLogWriter(String text, {bool isError = false}) {
    print('** ' + text + ' [' + isError.toString() + ']');
  }

  Locale getLocale() {
    if (APP_DATA.read(AppKey.keyLocale) == 1)
      return const Locale('en', 'US');
    else
      return const Locale('vi', 'VN');
  }
}

void _registerHttpsRequest() {
  var context = SecurityContext.defaultContext;

  List<int> bytes = utf8.encode(AppUrl.httpsCertificate);
  context.setTrustedCertificatesBytes(bytes);

  HttpOverrides.global = MyHttpOverrides();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..maxConnectionsPerHost = 10;
  }
}

class GetBack extends GetObserver {
  final Function(Routing?)? routing;

  // ignore: unused_field
  final Routing? _routeSend;

  GetBack([this.routing, this._routeSend]) : super(routing, _routeSend);

  @override
  Future<void> didPop(Route route, Route? previousRoute) async {
    KeyBoard.hide();
    await 300.milliseconds.delay();
    super.didPop(route, previousRoute);
  }
}

///remove overscroll
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
