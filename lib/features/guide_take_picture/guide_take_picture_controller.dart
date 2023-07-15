import 'package:get/get.dart';

import '../../base/controller/base_controller.dart';
import '../../routes/app_routes.dart';

class GuideTakePictureController extends BaseGetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void navToTakePicture() {
    Get.toNamed(Routes.routeTakePictureCard);
  }
}
