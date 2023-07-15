import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/widget/base_get_widget.dart';
import '../../const/colors.dart';
import '../../const/dimens.dart';
import '../../const/string_value.dart';
import '../../widgets/base/base_button.dart';
import 'controller/take_picture_card_controller.dart';

part 'take_picture_widget.dart';

class TakePictureCardPage extends BaseGetWidget {
  const TakePictureCardPage({Key? key}) : super(key: key);

  @override
  TakePictureController get controller => Get.put(TakePictureController());

  @override
  Widget buildWidgets() {
    return WillPopScope(
      onWillPop: () {
        controller.cameraController.dispose();
        return Future.value(true);
      },
      child: Obx(
        () => AspectRatio(
          aspectRatio: controller.cameraRatio.value,
          child: buildLoadingOverlay(
            () => Stack(
              fit: StackFit.expand,
              children: [
                CameraPreview(
                  controller.cameraController,
                  child: Image.asset(
                    AppStr.imgCamCard,
                    fit: BoxFit.fill,
                  ).paddingOnly(top: 80, bottom: Get.height - 350),
                ),
                cameraOverlay(controller, color: AppColors.colorEKYC())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
