import 'package:ekyc/base/widget/base_get_widget.dart';
import 'package:ekyc/features/home/home_controller.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/base/base_button.dart';

class HomePage extends BaseGetWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomeController get controller => Get.put(HomeController());

  @override
  Widget buildWidgets() {
    return buildBody();
  }

  Widget buildBody() {
    return Scaffold(
      body: Container(
        color: AppColors.bg(),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  buildLogoImage(),
                  buildImageEkyc(),
                  buildIntoText(),
                ],
              ),
            ),
            buildFooter()
          ],
        ),
      ),
    );
  }

  Widget buildLogoImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AppStr.imgSoftDreams,
          width: Get.width / 2.5,
        ).paddingOnly(left: AppDimens.paddingHuge),
        Image.asset(
          AppStr.imgDxTech,
          width: Get.width / 2.5,
        )
      ],
    ).paddingOnly(top: 20);
  }

  Widget buildImageEkyc() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimens.defaultPadding),
      child: Image.asset(
        AppStr.imgEkyc,
      ),
    ).paddingOnly(
        top: 40,
        left: AppDimens.defaultPadding,
        right: AppDimens.defaultPadding);
  }

  Widget buildIntoText() {
    return Text(
      'Một sản phẩm của SoftDreams và DXTech',
      style: TextStyle(
          color: AppColors.colorTextEKYC(),
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic),
    ).paddingOnly(top: 10);
  }

  Widget buildFooter() {
    return Column(
      children: [
        BaseButton.buildButton(
          AppStr.start.toUpperCase().tr,
          () async {
            await controller.navToLogin();
          },
        ).paddingAll(AppDimens.paddingSmall),
        Text(
          'Version 1.0.0',
          style: TextStyle(color: AppColors.textColor()),
        )
      ],
    );
  }
}
