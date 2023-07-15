import 'package:ekyc/base/base.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/text_input_model.dart';
import '../utils_widget.dart';
import 'check_idCard_info_controller.dart';

class CheckIdCardInfoPage extends BaseGetWidget {
  const CheckIdCardInfoPage({Key? key}) : super(key: key);

  @override
  CheckIdCardInfoController get controller =>
      Get.put(CheckIdCardInfoController());

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
                        AppDimens.textFieldMedium),
                    buildText(['Kiểm tra', 'thông tin']),
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
              icon: Icons.badge,
              hintText: 'Số CMND/CCCD (phải còn hiệu lực)',
              textEditingController: controller.idCardController,
              focusNode: controller.idCardNode,
              currentLength: controller.currentIdCardLength,
              maxLength: 20,
            ),
          ),
          const SizedBox(height: AppDimens.padding10),
          buildDateInput(
            TextInputModel(
                textEditingController: controller.startDateController,
                focusNode: controller.startDateNode,
                hintText: 'Ngày cấp'),
          ),
          const SizedBox(height: AppDimens.padding10),
          buildDateInput(
            TextInputModel(
                textEditingController: controller.endDateController,
                focusNode: controller.endDateNode,
                hintText: 'Ngày hết hạn'),
          ),
          const SizedBox(height: AppDimens.padding10),
          buildInput(
            TextInputModel(
              icon: Icons.location_on,
              hintText: 'Nơi cấp',
              textEditingController: controller.addressController,
              focusNode: controller.addressNode,
              currentLength: controller.currentAddressLength,
              maxLength: 50,
            ),
          ),
        ],
      ).paddingAll(AppDimens.defaultPadding),
    );
  }
}
