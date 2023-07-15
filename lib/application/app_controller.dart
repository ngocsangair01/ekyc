import 'package:camera/camera.dart';
import 'package:ekyc/base/base.dart';
import 'package:ekyc/const/const.dart';
import 'package:ekyc/features/model/image_path_model.dart';
import 'package:ekyc/features/model/response_ekyc.dart';
import 'package:ekyc/features/nfc/user_model.dart';
import 'package:ekyc/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

/// Biến để lưu trữ, đọc dữ liệu khi dùng db
// ignore: non_constant_identifier_names
late Box HIVE_APP;

/// Biến để lưu trữ, đọc dữ liệu (nhanh hơn Hive, tránh trường hợp lỗi key chưa được khởi tạo)
// ignore: non_constant_identifier_names
GetStorage APP_DATA = GetStorage();

class AppController extends GetxController {
  List<CameraDescription> cameras = [];
  DataOcrModel dataOcrModel = DataOcrModel(ImagePath(), ResponseEkyc());
  UserModel userModel = UserModel();

  @override
  void onInit() {
    initHive().then((value) async {
      Get.put(BaseRequest(), permanent: true);

      Get.put(BaseGetxController(), permanent: true);
      Get.offAndToNamed(Routes.routeHome);
    });
    super.onInit();
  }

  Future<void> initHive() async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    HIVE_APP = await Hive.openBox(AppStr.appName);
    HIVE_APP.delete(AppKey.keyToken);
  }
}
