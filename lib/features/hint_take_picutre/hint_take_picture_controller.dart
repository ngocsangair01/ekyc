import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:ekyc/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../choose_type_idCard/choose_type_idCard_page.dart';

class HintTakePictureController extends BaseGetxController {
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

  void confirmNext() {
    Get.to(() => ChooseTypeIdCardPage());
  }
}
