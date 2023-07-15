import 'package:get/get.dart';

import '../../base/controller/base_controller.dart';
import '../../routes/app_routes.dart';

class ChooseDocController extends BaseGetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void navToGuideTakePicture() {
    Get.toNamed(Routes.routeQRGuidePage);
  }
}
