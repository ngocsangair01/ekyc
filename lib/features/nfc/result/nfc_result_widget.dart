part of 'nfc_result_page.dart';

Widget _buildTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildBaseText(
        'Thông tin ',
        textColor: AppColors.bg(),
        fontSize: AppDimens.fontExtraLarge,
      ),
    ],
  ).paddingOnly(bottom: AppDimens.paddingVerySmall);
}

Widget _buildListGuild(NfcResultController controller) {
  return Column(
    children: [
      // buildInput(TextInputModel(textEditingController: controller.image1)),
      Image.memory(
        base64Decode(controller.image ?? ""),
        width: 150,
      ),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText('ID: ${controller.idDocument}'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText('First name: ${controller.firstName}'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText('Last name: ${controller.lastName}'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText('Gender: ${controller.gender}'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText('Nationality: ${controller.nationality}'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText('Date Of Birth: ${controller.dateOfBirth}'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText('Date Of Expiry: ${controller.dateOfExpiry}'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText('Digital Signatural: ${controller.digitalSignatural}'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText('CA: ${controller.dg15}'),
      SizedBox(height: AppDimens.paddingVerySmall),
    ],
  ).paddingSymmetric(horizontal: AppDimens.paddingVerySmall);
}

Widget _buildItemText(String title) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
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

Widget _buildDivider() {
  return BaseWidget.buildDivider(
    color: AppColors.colorGreyEKYC(),
    indent: AppDimens.defaultPadding,
    thickness: 0.5,
  ).paddingSymmetric(vertical: AppDimens.paddingVerySmall);
}

Widget _buildAction(NfcResultController controller) {
  return BaseButton.buildButton(
    AppStr.start.toUpperCase().tr,
    () async {
      controller.navToLivenessPage();
    },
    colors: AppColors.colorOrangeBtn,
  ).paddingAll(AppDimens.paddingSmall);
}
