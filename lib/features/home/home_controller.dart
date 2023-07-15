import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../application/app_controller.dart';
import '../../base/controller/base_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/permission.dart';
import '../../utils/show_popup.dart';

class HomeController extends BaseGetxController {
  AppController appController = Get.find<AppController>();
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> navToLogin() async {
    PermissionStatus permissionStatus =
        await checkPermission([Permission.camera]);
    switch (permissionStatus) {
      case PermissionStatus.granted:
        {
          appController.cameras = await availableCameras();
          Get.toNamed(Routes.routeLogin);
        }
        break;
      case PermissionStatus.permanentlyDenied:
        ShowPopup.openAppSetting();
        break;
      default:
        return;
    }
  }
}
