import 'package:ekyc/base/base.dart';
import 'package:ekyc/features/qr_code/user_information.dart';
import 'package:get/get.dart';

class QRResultController extends BaseGetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

  void getData() {
    if (Get.arguments != null) {
      UserInformation userInformation = Get.arguments;
      print(userInformation);
    }
  }
}
