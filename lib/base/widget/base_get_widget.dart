import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';
import 'package:ekyc/widgets/base/base.dart';

import '../base.dart';

abstract class BaseGetWidget<T extends BaseGetxController> extends GetView<T>
    with WidgetsBindingObserver {
  const BaseGetWidget({Key? key}) : super(key: key);

  Widget buildWidgets();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addObserver(this);
    controller.isKeyBoardShow.value =
        MediaQuery.of(context).viewInsets.bottom != 0;
    return buildWidgets();
    // return WillPopScope(
    //     // tắt tính năng vuốt trái để back lại màn hình trước đó trên iphone
    //     onWillPop: () async {
    //       KeyBoard.hide();
    //       await 300.milliseconds.delay();
    //       return !Navigator.of(context).userGestureInProgress;
    //     },
    //     child: buildWidgets());
  }

  Widget buildLoadingOverlay(WidgetCallback child) {
    return Obx(
      () => LoadingOverlayPro(
        progressIndicator: BaseWidget.buildLoading(),
        isLoading: controller.isLoadingOverlay.value,
        child: child(),
      ),
    );
  }
}
