part of 'choose_doc_page.dart';

Widget _buildTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildBaseText(
        'Xác thực giấy tờ',
        textColor: AppColors.bg(),
        fontSize: AppDimens.paddingBig,
        fontWeight: FontWeight.w600,
      ),
      buildBaseText(
        'Chọn giấy tờ bạn muốn xác thực',
        textColor: AppColors.bg(),
        fontSize: AppDimens.paddingMedium,
      ),
    ],
  ).paddingOnly(bottom: AppDimens.paddingHuge);
}

Widget _listDoc(ChooseDocController controller) {
  return Column(
    children: [
      _buildItemDoc(
        controller,
        AppStr.imgCardCCCD,
        'Chứng minh thư, Thẻ căn cước',
      ),
      _buildDivider(),
      _buildItemDoc(
        controller,
        AppStr.imgCardCCCD,
        'Thẻ căn cước gắn chíp',
      ),
      _buildDivider(),
      _buildItemDoc(
        controller,
        AppStr.imgCardCCCD,
        'Hộ chiếu',
        isBlur: true,
      ),
      _buildDivider(),
      _buildItemDoc(
        controller,
        AppStr.imgCardCCCD,
        'Chứng minh thư quân đội',
        isBlur: true,
      ),
      _buildDivider(),
      _buildItemDoc(
        controller,
        AppStr.imgCardCCCD,
        'Bằng lái xe',
        isBlur: true,
      ),
    ],
  );
}

Widget _buildItemDoc(
    ChooseDocController controller, String image, String tittle,
    {bool isBlur = false}) {
  return GestureDetector(
    onTap: () {
      controller.navToGuideTakePicture();
    },
    child: Opacity(
      opacity: isBlur ? .5 : 1,
      child: ListTile(
        leading: Image.asset(image),
        title: buildBaseText(tittle, textAlign: TextAlign.left),
        trailing: Icon(Icons.arrow_forward_ios, color: AppColors.bg()),
        contentPadding: EdgeInsets.only(left: 0, right: 16),
        horizontalTitleGap: 0,
      ),
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
