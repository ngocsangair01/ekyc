import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/widget/base_get_widget.dart';
import '../../../const/colors.dart';
import '../../../const/dimens.dart';
import '../../../const/string_value.dart';
import '../../../widgets/base/base_button.dart';
import 'liveness_result_controller.dart';

class LivenessResultPage extends BaseGetWidget {
  const LivenessResultPage({Key? key}) : super(key: key);

  @override
  LivenessResultController get controller =>
      Get.put(LivenessResultController());

  @override
  Widget buildWidgets() {
    return buildLoadingOverlay(
      () => Scaffold(
        backgroundColor: Colors.transparent,
        body: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bg(),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [buildResult()],
            ).paddingOnly(top: AppDimens.sizeDialogNotiIcon),
          ),
          BaseButton.buildButtonChild(
            AppStr.confirm.tr,
            () {
              controller.confirmNext();
            },
          ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
        ],
      ).paddingOnly(bottom: AppDimens.defaultPadding),
    );
  }

  Widget buildResult() {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: Get.width / 2,
            child: Image.asset(!controller.checked.value
                ? AppStr.imgHourglass
                : controller.faceMatching!.value
                    ? AppStr.imgSuccess
                    : AppStr.imgFailed),
          ).paddingOnly(bottom: AppDimens.paddingMedium),
          Text(
            !controller.checked.value
                ? AppStr.inProcess.tr
                : controller.faceMatching!.value
                    ? AppStr.successAuthenMessage.tr
                    : AppStr.failureAuthenMessage.tr,
            style: TextStyle(
                color: AppColors.textColor(),
                fontSize: AppDimens.fontExtraLarge),
          ),
          Text(
            !controller.checked.value
                ? ''
                : controller.livenessResult!.percent.toString(),
            style: TextStyle(
              color: AppColors.textColor(),
              fontSize: AppDimens.fontExtraLarge,
            ),
          )
        ],
      ).paddingOnly(top: AppDimens.sizeImage),
    );
  }
}
