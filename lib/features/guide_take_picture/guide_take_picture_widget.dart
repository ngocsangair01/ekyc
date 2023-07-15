part of 'guide_take_picture_page.dart';

Widget _buildTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildBaseText(
        'Hướng dẫn',
        textColor: AppColors.bg(),
        fontSize: AppDimens.paddingBig,
        fontWeight: FontWeight.w600,
      ),
      buildBaseText(
        'chụp ảnh CMT/Thẻ căn cước',
        textColor: AppColors.bg(),
        fontSize: AppDimens.paddingMedium,
      ),
    ],
  ).paddingOnly(bottom: AppDimens.paddingHuge);
}

Widget _buildRowCard() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildItemCard(AppStr.imgFrontCard, 'Bước1: \nChụp mặt trước'),
      _buildItemCard(AppStr.imgBackCard, 'Bước2: \nChụp mặt sau'),
    ],
  );
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
      _buildItemText(
          'Giấy tờ còn hạn sử dụng. Là hình gốc, không scan và photocopy'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText('Đặt giấy tờ trên 1 mặt phẳng'),
      SizedBox(
        height: AppDimens.paddingVerySmall,
      ),
      _buildItemText('Đảm bảo ảnh rõ nét, không bị mờ loá'),
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

Widget _buildRowErrorCard() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildItemCard(AppStr.imgCardEr1, 'Không chụp\nquá mờ'),
      _buildItemCard(AppStr.imgCardEr2, 'Không chụp\nmất góc'),
      _buildItemCard(AppStr.imgCardEr3, 'Không chụp\nmất góc'),
    ],
  );
}

Widget _buildDivider() {
  return BaseWidget.buildDivider(
    color: AppColors.colorGreyEKYC(),
    indent: AppDimens.defaultPadding,
    thickness: 0.5,
  ).paddingSymmetric(vertical: AppDimens.paddingVerySmall);
}

Widget _buildAction(GuideTakePictureController controller) {
  return BaseButton.buildButton(
    AppStr.takePicture.toUpperCase().tr,
    () {
      controller.navToTakePicture();
    },
    colors: AppColors.colorOrangeBtn,
  ).paddingAll(AppDimens.paddingSmall);
}
