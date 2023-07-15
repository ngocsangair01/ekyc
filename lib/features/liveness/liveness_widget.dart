part of 'liveness_page.dart';

Widget cameraOverlay(LivenessController controller, {Color? color}) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.topCenter,
        child: Container(
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
              backgroundColor: AppColors.bg(),
              iconTheme:
                  Get.theme.iconTheme.copyWith(color: AppColors.colorEKYC()),
              elevation: 0,
              title: Text(
                AppStr.turnRight.tr,
                style: TextStyle(
                  color: AppColors.colorEKYC(),
                  fontSize: AppDimens.fontExtraLarge,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
            ),
            // body: Center(
            //   child: Text(
            //     AppStr.turnRight.tr,
            //     style: TextStyle(
            //       color: AppColors.colorEKYC(),
            //       fontSize: AppDimens.fontExtraLarge,
            //       fontWeight: FontWeight.w500,
            //     ),
            //   ),
            // ),
            backgroundColor: AppColors.bg(),
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 140,
          color: color,
          child: Column(
            children: [_buildListStep(controller), _buildButton(controller)],
          ),
        ),
      ),
    ],
  );
}

Widget _buildListStep(LivenessController controller) {
  return Expanded(
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) => _buildItemStep(controller, index += 1),
      separatorBuilder: (context, index) =>
          SizedBox(width: AppDimens.paddingVerySmall),
      itemCount: 6,
    ),
  );
}

Widget _buildItemStep(LivenessController controller, int index) {
  return CircleAvatar(
    maxRadius: 28,
    backgroundColor: AppColors.colorGreyEKYC(),
    child: buildBaseText(
      index.toString(),
      fontSize: AppDimens.fontExtraLarge,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget _buildButton(LivenessController controller) {
  return BaseButton.buildButton(
    controller.isFrontImg.value
        ? AppStr.next.toUpperCase().tr
        : AppStr.next.toUpperCase().tr,
    () {
      controller.takePicture();
    },
    colors: AppColors.colorPurpleBtn,
  ).paddingOnly(
    left: AppDimens.paddingSmall,
    right: AppDimens.paddingSmall,
    bottom: AppDimens.paddingSmall,
  );
}
