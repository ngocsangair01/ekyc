part of 'nfc_page.dart';

Widget _buildListImage() {
  return Center(child: Image.asset(AppStr.imgReadNfc, height: 120))
      .paddingOnly(bottom: AppDimens.paddingSmall);
}

Widget _buildTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildBaseText(
        'Hướng dẫn',
        textColor: AppColors.bg(),
        fontSize: AppDimens.fontExtraLarge,
      ),
      buildBaseText(
        'Đặt thẻ căn cước công dân',
        textColor: AppColors.bg(),
        fontSize: AppDimens.fontExtraLarge,
      ),
    ],
  ).paddingOnly(bottom: AppDimens.defaultPadding);
}

Widget _buildItemCard(String image, String title) {
  return Column(
    children: [
      Image.asset(image, height: 60),
      SizedBox(height: AppDimens.paddingVerySmall),
      buildBaseText(title)
    ],
  );
}

Widget _buildListGuild() {
  return Column(
    children: [
      _buildItemText('Bấm vào nút BẮT ĐẦU để bắt đầu quét thẻ'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText(
          'Để điện thoại vào bên trên thẻ, không di chuyển thẻ và điện thoại trong khi quá trình đọc đang thực thi'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText(
          'Di chuyển điện thoại lên xuống từ từ cho đến khi thông báo hiện lên'),
      SizedBox(
        height: AppDimens.paddingVerySmall,
      ),
    ],
  ).paddingSymmetric(horizontal: AppDimens.paddingVerySmall);
}

Widget _buildItemText(String title) {
  return Row(
    children: [
      buildBaseText("•   ",
          textColor: AppColors.colorRed(), fontSize: AppDimens.paddingMedium),
      Expanded(
        child: buildBaseText(title,
            textColor: AppColors.bg(), textAlign: TextAlign.left),
      ),
    ],
  );
}

Widget _buildTextInitializing(NfcController controller) {
  return Visibility(
    visible: controller.isReading.value,
    child: Column(
      children: [
        buildBaseText("Đang đọc..."),
        buildBaseText("Vui lòng không di chuyển căn cước và điện thoại"),
      ],
    ),
  );
}

Widget _buildDivider() {
  return BaseWidget.buildDivider(
    color: AppColors.colorGreyEKYC(),
    indent: AppDimens.defaultPadding,
    thickness: 0.5,
  ).paddingSymmetric(vertical: AppDimens.paddingVerySmall);
}

Widget _buildAction(NfcController controller) {
  return BaseButton.buildButton(
    AppStr.start.toUpperCase().tr,
    () async {
      await controller.readMRTD();
      if (controller.appController.userModel.code != null) {
        Get.toNamed(Routes.routeNfcResultPage);
      }
    },
    colors: AppColors.colorOrangeBtn,
  ).paddingAll(AppDimens.paddingSmall);
}
