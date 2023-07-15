import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ekyc/application/app_controller.dart';
import 'package:ekyc/const/const.dart';
import 'package:ekyc/widgets/base/base.dart';

class LogoPage extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    Get.put(AppController(), permanent: true);
    return SafeArea(
      child: Container(
        color: AppColors.bg(),
        alignment: Alignment.center,
        child: BaseWidget.buildLogo(AppStr.imgLogoEkyc, AppDimens.sizeImage,
            width: Get.width / 2),
      ),
    );
  }
}
