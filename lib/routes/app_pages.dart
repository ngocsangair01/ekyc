import 'package:ekyc/features/check_idCard_info/check_idCard_info_page.dart';
import 'package:ekyc/features/nfc/nfc_page.dart';
import 'package:ekyc/features/nfc/result/nfc_result_page.dart';
import 'package:ekyc/features/qr_code/qr_guide.dart';
import 'package:get/get.dart';

import '../features/area/area_page.dart';
import '../features/check_basic_info/check_basic_info_page.dart';
import '../features/choose_doc/choose_doc_page.dart';
import '../features/confirm_otp/confirm_otp_page.dart';
import '../features/create_account/create_account_page.dart';
import '../features/ekyc_result/ekyc_result_page.dart';
import '../features/guide_take_picture/guide_take_picture_page.dart';
import '../features/guide_take_portrait/guide_take_portrait_page.dart';
import '../features/home/home_page.dart';
import '../features/liveness/liveness_page.dart';
import '../features/liveness/webview_liveness.dart';
import '../features/liveness_result/liveness_result_page.dart';
import '../features/login/login_page.dart';
import '../features/splash/logo_page.dart';
import '../features/take_picture/take_picture_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final route = [
    GetPage(
      name: '/',
      page: () => LogoPage(),
    ),
    GetPage(
      name: Routes.routeHome,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.routeEKycResult,
      page: () => EkycResultPage(),
    ),
    GetPage(
      name: Routes.routeCheckBasicInfo,
      page: () => CheckBasicInfoPage(),
    ),
    GetPage(
      name: Routes.routeCheckIdCardInfo,
      page: () => CheckIdCardInfoPage(),
    ),
    GetPage(
      name: Routes.routeArea,
      page: () => AreaPage(),
    ),
    GetPage(
      name: Routes.routeLogin,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.routeConfirmOtp,
      page: () => ConfirmOtpPage(),
    ),
    GetPage(
      name: Routes.routeChooseDoc,
      page: () => ChooseDocPage(),
    ),
    GetPage(
      name: Routes.routeGuideTakePicture,
      page: () => GuideTakePicturePage(),
    ),
    GetPage(
      name: Routes.routeTakePictureCard,
      page: () => TakePictureCardPage(),
    ),
    GetPage(
      name: Routes.routeGuideTakePortrait,
      page: () => GuideTakePortraitPage(),
    ),
    GetPage(
      name: Routes.routeLiveness,
      page: () => LivenessPage(),
    ),
    GetPage(
      name: Routes.routeCreateAccount,
      page: () => CreateAccountPage(),
    ),
    GetPage(
      name: Routes.routeWebViewLiveness,
      page: () => WebViewLivenessPage(),
    ),
    GetPage(
      name: Routes.routeLivenessResult,
      page: () => LivenessResultPage(),
    ),
    GetPage(
      name: Routes.routeNfcPage,
      page: () => NfcPage(),
    ),
    GetPage(
      name: Routes.routeNfcResultPage,
      page: () => NfcResultPage(),
    ),
    GetPage(
      name: Routes.routeQRGuidePage,
      page: () => QRGuidePage(),
    ),
  ];
}
