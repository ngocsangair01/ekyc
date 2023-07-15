import 'package:camera/camera.dart';
import 'package:ekyc/features/utils_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/widget/base_get_widget.dart';
import '../../const/colors.dart';
import '../../const/dimens.dart';
import '../../const/string_value.dart';
import '../../widgets/base/base_button.dart';
import 'controller/liveness_controller.dart';

part 'liveness_widget.dart';

class LivenessPage extends BaseGetWidget {
  const LivenessPage({Key? key}) : super(key: key);

  @override
  LivenessController get controller => Get.put(LivenessController());

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
                    AppStr.imgBgLive1,
                    fit: BoxFit.cover,
                  ),
                ).paddingOnly(top: 80, bottom: 140),
                cameraOverlay(controller, color: AppColors.bg())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
