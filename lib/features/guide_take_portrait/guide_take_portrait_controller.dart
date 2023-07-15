import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../base/controller/base_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/permission.dart';
import '../../utils/show_popup.dart';

class GuideTakePortraitController extends BaseGetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void navToLivenessPage() async {
    PermissionStatus permissionStatus =
        await checkPermission([Permission.camera]);
    switch (permissionStatus) {
      case PermissionStatus.granted:
        {
          Get.toNamed(Routes.routeWebViewLiveness);
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
