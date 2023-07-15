part of 'take_picture_page.dart';

Widget cameraOverlay(TakePictureController controller, {Color? color}) {
  return Stack(children: [
    // Align(
    //     alignment: Alignment.centerLeft,
    //     child: Container(width: 20, color: color)),
    // Align(
    //     alignment: Alignment.centerRight,
    //     child: Container(width: 20, color: color)),
    Align(
      alignment: Alignment.topCenter,
      child: Obx(
        () => Container(
          height: 80,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () async {
                  Get.back();
                  await controller.cameraController.dispose();
                },
                icon: Icon(Icons.clear),
              ),
              backgroundColor: AppColors.colorEKYC(),
              iconTheme: Get.theme.iconTheme.copyWith(color: AppColors.bg()),
              elevation: 0,
              title: Text(
                controller.isFrontImg.value
                    ? AppStr.takeFrontPicture.tr
                    : AppStr.takeBackPicture.tr,
                style: TextStyle(color: AppColors.bg(), fontSize: 24),
              ),
              centerTitle: true,
            ),
            backgroundColor: AppColors.colorEKYC(),
          ),
        ),
      ),
    ),
    Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: AppDimens.padding10),
        height: Get.height - 330,
        color: color,
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => SingleChildScrollView(
                  child: _buildGuide(controller),
                ),
              ),
            ),
            _buildButton(controller)
          ],
        ),
      ),
    ),
    // Container(
    //   width: Get.width,
    //   margin: const EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 400),
    //   decoration: BoxDecoration(border: Border.all(color: Colors.cyan),),
    //   child: Image.asset(
    //       controller.frontImg.value ? AppStr.imgGuideFront : AppStr.imgGuideBack)
    //   // ),
    // )
  ]);
  // });
}

Widget _buildGuide(TakePictureController controller) {
  return Column(
    children: [
      DefaultTextStyle(
        style: TextStyle(
            color: AppColors.bg(),
            fontWeight: FontWeight.w500,
            fontSize: AppDimens.fontExtraLarge),
        child: Text(
          AppStr.guideTakePicture.tr,
          textAlign: TextAlign.center,
        ),
      ).paddingSymmetric(
          vertical: AppDimens.defaultPadding,
          horizontal: AppDimens.paddingSmall),
      Container(
        height: 150,
        child: Image.asset(controller.isFrontImg.value
            ? AppStr.imgFrontCard
            : AppStr.imgBackCard),
      ).paddingOnly(bottom: AppDimens.defaultPadding)
    ],
  );
}

Widget _buildButton(TakePictureController controller) {
  return BaseButton.buildButton(
    controller.isFrontImg.value
        ? AppStr.takeBackPicture.toUpperCase().tr
        : AppStr.next.toUpperCase().tr,
    () {
      controller.takePicture();
    },
    colors: AppColors.colorOrangeBtn,
  ).paddingAll(AppDimens.paddingSmall);
}
