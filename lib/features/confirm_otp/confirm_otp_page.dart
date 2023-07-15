import 'package:auto_size_text/auto_size_text.dart';
import 'package:ekyc/base/base.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../utils_widget.dart';
import 'confirm_otp_controller.dart';

class ConfirmOtpPage extends BaseGetWidget {
  const ConfirmOtpPage({Key? key}) : super(key: key);

  @override
  ConfirmOtpController get controller => Get.put(ConfirmOtpController());

  @override
  Widget buildWidgets() {
    return buildScaffold();
  }

  Widget buildScaffold() {
    return Scaffold(
      backgroundColor: AppColors.bg(),
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // buildProgress(AppDimens.paddingOddSmallest, AppDimens.sizeIconSpinner),
                buildText(['Nhập', 'Mã xác thực']),
                buildOtp(controller),
                // buildResendOtp(),
              ],
            ),
          ),
        ),
        buildFooter(
          AppStr.next.toUpperCase().tr,
          () {
            controller.confirmNext();
          },
        ),
      ],
    );
  }

  Widget buildOtp(ConfirmOtpController controller) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF8E8D92),
          ),
        ),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFD42227),
          ),
        ),
      ),
    );

    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFE3A0A3)),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        children: [
          Image.asset(
            AppStr.imgPhone,
            height: 60,
          ),
          AutoSizeText(
            "Mã OTP đã được gửi đến số điện thoại 0999999999\nQuý khách vui lòng nhập OTP để kích hoạt",
            style: TextStyle(
              color: AppColors.textColor(),
            ),
            textAlign: TextAlign.center,
          ).paddingSymmetric(vertical: AppDimens.defaultPadding),
          Pinput(
            controller: controller.otpController,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            onCompleted: (pin) => () {},
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          buildResendOtp(),
        ],
      ).paddingOnly(top: AppDimens.paddingSmall),
    ).paddingAll(AppDimens.defaultPadding);
  }

  Widget hintText() {
    return Expanded(
      // width: Get.width,
      child: RichText(
        text: TextSpan(
          text: 'Mã xác thực đã gửi đến ',
          children: [
            TextSpan(
                text: '${controller.mail}.\n',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: 'Vui lòng kiểm tra '),
            TextSpan(
                text: 'hộp thư rác ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: 'nếu bạn không thể tìm thấy ở hộp thư đến'),
          ],
          style: TextStyle(color: AppColors.colorTextEKYC()),
        ),
      ),
    );
  }

  Widget buildResendOtp() {
    return TextButton(
      onPressed: controller.resetOtp.value ? () {} : null,
      child: AutoSizeText(
        'Gửi lại mã',
        style: TextStyle(
          color: AppColors.colorEKYC(),
          // fontSize: AppDimens.fontExtraLarge,
        ),
      ),
    ).paddingOnly(top: 10);
  }

// Widget buildCountDown() {
//   return CircularCountDownTimer(
//     duration: 30,
//     controller: controller.countDownController,
//     width: 30,
//     height: 20,
//     ringColor: Colors.white,
//     fillColor: AppColors.colorEKYC(),
//     backgroundColor: Colors.white,
//     strokeWidth: 8.0,
//     isReverse: true,
//     autoStart: true,
//     textStyle: const TextStyle(fontSize: 12),
//     onComplete: () {
//       controller.resetOtp.value = true;
//       // controller.countDownController.restart();
//     },
//   ).paddingOnly(top: AppDimens.paddingSmall);
// }
}
