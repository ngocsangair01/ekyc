import 'package:ekyc/base/base.dart';
import 'package:ekyc/const/const.dart';
import 'package:ekyc/features/model/radio_button_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/text_input_model.dart';
import '../utils_widget.dart';
import 'check_basic_info_controller.dart';

class CheckBasicInfoPage extends BaseGetWidget {
  const CheckBasicInfoPage({Key? key}) : super(key: key);

  @override
  CheckBasicInfoController get controller =>
      Get.put(CheckBasicInfoController());

  @override
  Widget buildWidgets() {
    return buildScaffold();
  }

  Widget buildScaffold() {
    return Scaffold(
      appBar: buildAppBar(showIcon: false),
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
                    buildProgress(
                        AppDimens.paddingOddSmallest, AppDimens.btnMedium),
                    buildText(['Kiểm tra', 'thông tin cá nhân']),
                    buildHint(buildHintItem())
                        .paddingOnly(top: AppDimens.defaultPadding),
                    buildListInput(),
                  ],
                ),
              ),
            ),
          ),
          buildFooter(AppStr.confirm.toUpperCase().tr, () {
            controller.confirmNext();
          }),
        ],
      ),
    );
  }

  Widget buildHintItem() {
    return Expanded(
      child: Text(
          'Hãy chắc chắn rằng những thông tin bên dưới trùng khớp với thông tin thể hiện trên giấy tờ tùy thân'),
    );
  }

  Widget buildListInput() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          buildInput(
            TextInputModel(
              icon: Icons.person,
              hintText: 'Họ và tên',
              textEditingController: controller.nameController,
              focusNode: controller.nameNode,
              currentLength: controller.currentNameLength,
              maxLength: 20,
            ),
          ),
          const SizedBox(height: AppDimens.padding10),
          buildDateInput(
            TextInputModel(
                textEditingController: controller.dobController,
                focusNode: controller.dobNode,
                hintText: 'Ngày sinh'),
          ),
          const SizedBox(height: AppDimens.padding10),
          buildChoiceInput(
            RadioButtonModel(
                title: 'Giới tính',
                choices: ['Nam', 'Nữ'],
                isTrue: controller.isMale),
          )
        ],
      ).paddingAll(AppDimens.defaultPadding),
    );
  }
}
