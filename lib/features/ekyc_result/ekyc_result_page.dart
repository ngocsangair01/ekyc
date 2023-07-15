import 'package:ekyc/features/utils_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/widget/base_get_widget.dart';
import '../../const/colors.dart';
import '../../const/dimens.dart';
import '../../const/string_value.dart';
import '../../routes/app_routes.dart';
import '../../widgets/base/base_button.dart';
import 'ekyc_result_controller.dart';

part 'ekyc_result_widget.dart';

class EkycResultPage extends BaseGetWidget {
  const EkycResultPage({Key? key}) : super(key: key);

  @override
  EkycResultController get controller => Get.put(EkycResultController());

  @override
  Widget buildWidgets() {
    return buildLoadingOverlay(
      () => Scaffold(
        appBar: AppBar(
          title: buildBaseText(
            'Thông tin cá nhân',
            textColor: AppColors.textColor(),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
          backgroundColor: AppColors.bg(),
          iconTheme: Get.theme.iconTheme.copyWith(color: AppColors.textColor()),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: _buildBody(controller),
      ),
    );
  }
}
