import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:ekyc/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/permission.dart';
import '../../utils/show_popup.dart';
import '../take_picture/take_picture_page.dart';

class ChooseTypeIdCardController extends BaseGetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final FocusNode otpNode = FocusNode();

  RxInt currentOtpLength = 0.obs;
  RxBool resetOtp = false.obs;

  CountDownController countDownController = CountDownController();

  @override
  void onInit() {
    super.onInit();
  }

  dynamic confirmNext() async {
    PermissionStatus permissionStatus =
        await checkPermission([Permission.camera]);
    switch (permissionStatus) {
      case PermissionStatus.granted:
        {
          Get.to(() => const TakePictureCardPage());
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
