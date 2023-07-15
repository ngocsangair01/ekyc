import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sds_flutter/lib_button/text_button.dart';
import 'package:sds_flutter/lib_input/text_form_model.dart';

import '../../base/widget/base_get_widget.dart';
import '../../const/app_const.dart';
import '../../const/colors.dart';
import '../../const/dimens.dart';
import '../../widgets/base/base_widget.dart';
import '../../widgets/base/decoration.dart';
import '../../widgets/others/form_input.dart';
import '../utils_widget.dart';
import 'area_controller.dart';

class AreaPage extends BaseGetWidget {
  const AreaPage({Key? key}) : super(key: key);

  @override
  AreaController get controller => Get.put(AreaController());

  @override
  Widget buildWidgets() {
    return buildScaffold();
  }

  Widget buildScaffold() {
    return Scaffold(
      appBar: buildAppBar(
          title: Text(
            controller.title.value,
            style: TextStyle(color: AppColors.colorEKYC()),
          ),
          showActions: false),
      body: buildBody(),
    );
  }

  buildBody() {
    return buildLoadingOverlay(
      () => Container(
        width: Get.width,
        height: Get.height,
        decoration: BaseDecoration().withDefaultBoxDecoration,
        child: SizedBox(
            child: Column(
          children: [_buildInput(), Expanded(child: _buildList())],
        ).paddingSymmetric(horizontal: AppDimens.defaultPadding)),
      ),
    );
  }

  Widget _buildInput() {
    return InputText(
      SdsTextFormFieldModel(
          controller: controller.textSearchController,
          textInputType: TextInputType.text,
          iconLeading: const Icon(Icons.search),
          autofocus: false,
          obscureText: false,
          hintText: controller.hintTextSearch.value,
          onChanged: (value) => controller.getListByName()),
    );
  }

  Widget _buildList() {
    return controller.data.isNotEmpty
        ? Obx(
            () => ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (BuildContext context, int index) => Ink(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppDimens.heightItemListSmall,
                      child: SdsTextButton(
                        onPressed: () {
                          controller.selectData(index);
                        },
                        style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft),
                        child: Text(
                          controller.data[index] != null
                              ? controller.data[index].name.toString()
                              : '',
                          style: Get.textTheme.bodyText2!.copyWith(
                              color: AppColors.text(),
                              fontSize: AppDimens.fontExtraLarge,
                              fontFamily: AppConst.fontAvertaRegular),
                        ),
                      ),
                    ),
                    BaseWidget.buildDivider(),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
