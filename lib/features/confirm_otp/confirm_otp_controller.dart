import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:ekyc/base/base.dart';
import 'package:ekyc/utils/show_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../routes/app_routes.dart';

class ConfirmOtpController extends BaseGetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final FocusNode otpNode = FocusNode();

  RxInt currentOtpLength = 0.obs;
  String mail = '';
  RxBool resetOtp = false.obs;

  CountDownController countDownController = CountDownController();

  @override
  void onInit() {
    super.onInit();
    mail = Get.arguments ?? 'example@gmail.com';
  }

  void confirmNext() {
    if (otpController.length == 4) {
      Get.offAllNamed(Routes.routeLogin);
    } else {
      ShowPopup.showDialogNotification('Vui lòng nhập đủ mã pin');
    }
  }
}
