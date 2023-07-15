import 'package:ekyc/base/base.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/base/base_button.dart';
import '../utils_widget.dart';
import 'choose_type_idCard_controller.dart';

class ChooseTypeIdCardPage extends BaseGetWidget {
  const ChooseTypeIdCardPage({Key? key}) : super(key: key);

  @override
  ChooseTypeIdCardController get controller =>
      Get.put(ChooseTypeIdCardController());

  @override
  Widget buildWidgets() {
    return buildScaffold();
  }

  Widget buildScaffold() {
    return Scaffold(
      appBar: buildAppBar(icon: Icons.clear, showActions: false),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.bg(),
              width: Get.width,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: [
                    buildText([
                      'Vui lòng chọn loại',
                      'giấy tờ tuỳ thân',
                      'để xác thực'
                    ]),
                    buildHint(hintText())
                        .paddingOnly(top: AppDimens.defaultPadding),
                  ],
                ),
              ),
            ),
          ),
          buildFooter(),
        ],
      ),
    );
  }

  Widget hintText() {
    return Expanded(
      // width: Get.width,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Mẹo chụp ảnh chân dung: \n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text:
                    '1. Vui lòng chuẩn bị giấy tờ tùy thân bản gốc \n2. Hãy đặt bên trong khung hình\n3. Tránh bị mất các góc giấy tờ\n4. Tránh bị chói')
          ],
          style: TextStyle(color: AppColors.colorTextEKYC()),
        ),
      ),
    );
  }

  Widget buildFooter() {
    return Column(
      children: [
        BaseButton.buildButtonChild(
          AppStr.idCard.tr,
          () async {
            await controller.confirmNext();
          },
        ),
        BaseButton.buildButton(
          AppStr.passPort.tr,
          () async {
            await controller.confirmNext();
          },
          textStyle: TextStyle(
            color: AppColors.colorEKYC(),
          ),
          colors: [
            AppColors.bg(),
            AppColors.bg(),
          ],
          border: Border.all(
            width: 1,
            color: AppColors.colorEKYC(),
          ),
        ).paddingSymmetric(vertical: AppDimens.paddingEvenSmallest),
      ],
    ).paddingOnly(
        left: AppDimens.defaultPadding,
        right: AppDimens.defaultPadding,
        bottom: AppDimens.defaultPadding);
  }
}
