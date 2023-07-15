import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:ekyc/base/base.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/base/base_widget.dart';
import '../model/text_input_model.dart';
import '../utils_widget.dart';
import 'hint_take_picture_controller.dart';

class HintTextPicturePage extends BaseGetWidget {
  const HintTextPicturePage({Key? key}) : super(key: key);

  @override
  HintTakePictureController get controller =>
      Get.put(HintTakePictureController());

  @override
  Widget buildWidgets() {
    return buildScaffold();
  }

  Widget buildScaffold() {
    return Scaffold(
      appBar: buildAppBar(),
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
                    buildProgress(AppDimens.paddingOddSmallest,
                        AppDimens.sizeIconSpinner),
                    buildText(
                        ['Vui lòng', 'chụp ảnh chân dung', 'để xác thực']),
                    buildHint(hintText())
                        .paddingOnly(top: AppDimens.defaultPadding),
                  ],
                ),
              ),
            ),
          ),
          buildFooter(AppStr.scan.toUpperCase().tr, () {
            controller.confirmNext();
          }),
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
                    '1. Giữ điện thoại ở trước mắt bạn\n2. Hình chân dung đủ sáng và không bị chói\n3. Không dùng kính mát\n4. Không đội mũ\nHình ảnh chân dung chỉ dùng cho mục đích xác thực với CMND/CCCD/Hộ chiếu.'),
          ],
          style: TextStyle(color: AppColors.colorTextEKYC()),
        ),
      ),
    );
  }
}
