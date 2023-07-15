import 'package:ekyc/base/base.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../area/area_page.dart';
import '../area/model/area_arguments.dart';
import '../model/address_model.dart';
import '../model/radio_button_model.dart';
import '../model/text_input_model.dart';
import '../utils_widget.dart';
import 'check_address_info_controller.dart';

class CheckAddressInfoPage extends BaseGetWidget {
  const CheckAddressInfoPage({Key? key}) : super(key: key);

  @override
  CheckAddressInfoController get controller =>
      Get.put(CheckAddressInfoController());

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
                        AppDimens.sizeImageMedium),
                    buildText(['Kiểm tra', 'địa chỉ']),
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
          buildInputProvince(),
          const SizedBox(height: AppDimens.padding10),
          buildInputDistrict(),
          const SizedBox(height: AppDimens.padding10),
          buildInputWard(),
          const SizedBox(height: AppDimens.padding10),
          buildInput(
            TextInputModel(
              icon: Icons.location_on,
              hintText: 'Địa chỉ',
              textEditingController: controller.addressController,
              focusNode: controller.addressNode,
              currentLength: controller.currentAddressLength,
              maxLength: 50,
            ),
          ),
          const SizedBox(height: AppDimens.padding10),
          buildChoiceInput(
            RadioButtonModel(
                title: 'Hiện tại bạn vẫn đang cư trú tại địa chỉ này?',
                choices: ['ĐÚNG', 'KHÔNG'],
                isTrue: controller.isTrue),
          )
        ],
      ).paddingAll(AppDimens.defaultPadding),
    );
  }

  Widget buildInputAddress(
      {required Function function, required RxString text}) {
    return Obx(
      () => buildCardBase(
        child: Center(
          child: GestureDetector(
            onTap: () {
              function.call();
            },
            child: Container(
              child: ListTile(
                leading: Icon(Icons.location_on),
                title: Text(text.value),
                trailing: Icon(Icons.arrow_forward_ios),
                minLeadingWidth: AppDimens.padding10,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputProvince() {
    return buildInputAddress(
      function: () {
        Get.to(() => AreaPage(),
                arguments: AreaArguments(AppConst.PROVINCE_FILTER))!
            .then(
          (value) => {
            if (value != null)
              {
                controller.province.value = value.name,
                controller.codeProvince = value.code
              }
          },
        );
      },
      text: controller.province,
    );
  }

  Widget buildInputDistrict() {
    return buildInputAddress(
      function: () {
        Get.to(() => AreaPage(),
                arguments: AreaArguments(AppConst.DISTRICT_FILTER,
                    value: controller.codeProvince))!
            .then(
          (value) => {
            if (value != null)
              {
                controller.district.value = value.name,
                controller.codeDistrict = value.code
              }
          },
        );
      },
      text: controller.district,
    );
  }

  Widget buildInputWard() {
    return buildInputAddress(
      function: () {
        Get.to(() => AreaPage(),
                arguments: AreaArguments(AppConst.WARD_FILTER,
                    value: controller.codeDistrict))!
            .then(
          (value) => {
            if (value != null)
              {
                controller.ward.value = value.name,
              }
          },
        );
      },
      text: controller.ward,
    );
  }
}
