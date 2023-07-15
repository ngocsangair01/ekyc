part of 'guide_take_portrait_page.dart';

Widget _buildListImage() {
  return Center(child: Image.asset(AppStr.imgMan, height: 120))
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
        'xác thực khuôn mặt chủ giấy tờ',
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
      _buildItemText('Chụp trong môi trường đủ sáng'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText(
          'Đưa khuôn mặt vào khung chính giữa màn hình trong quá trình thực hiện'),
      SizedBox(
        height: AppDimens.paddingVerySmall,
      ),
      _buildItemText(
          'Thực hiện quay trái, quay phải, ngửa đầu lên, gật đầu xuống theo chỉ dẫn, chi tiết thực hiện theo hướng dẫn'),
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
      _buildItemCard(AppStr.imgManBlur, 'Không chụp\nquá mờ'),
      _buildItemCard(AppStr.imgManGlass, 'Không\nđeo kính'),
      _buildItemCard(AppStr.imgManBright, 'Không chụp\nloá sáng'),
    ],
  ).paddingOnly(top: AppDimens.defaultPadding);
}

Widget _buildDivider() {
  return BaseWidget.buildDivider(
    color: AppColors.colorGreyEKYC(),
    indent: AppDimens.defaultPadding,
    thickness: 0.5,
  ).paddingSymmetric(vertical: AppDimens.paddingVerySmall);
}

Widget _buildAction(GuideTakePortraitController controller) {
  return BaseButton.buildButton(
    AppStr.next.toUpperCase().tr,
    () {
      controller.navToLivenessPage();
    },
    colors: AppColors.colorOrangeBtn,
  ).paddingAll(AppDimens.paddingSmall);
}
