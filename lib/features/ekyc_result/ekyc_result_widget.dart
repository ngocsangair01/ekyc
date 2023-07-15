part of 'ekyc_result_page.dart';

Widget _buildBody(EkycResultController controller) {
  return Container(
    color: AppColors.bg(),
    child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildRowText(
                    'Giấy tờ', 'Giấy tờ có mặt trước và mặt sau không khớp',
                    valueColor: Color(0xFFFF7D01)),
                _buildRowText('Số CMND', '068307001318'),
                _buildRowText('Họ tên', 'NGUYỄN VY MINH THƯ'),
                _buildRowText('Ngày sinh', '11/06/2007'),
                _buildRowText('Nơi ĐKHK TT',
                    '02 Cù Chính Lan, thị Trấn Liên Nghĩa, Đức Trọng, Lâm Đồng'),
                _buildRowText('Giới tính', 'Nữ'),
                _buildRowText('Ngày cấp', '16/09/2022'),
                _buildRowText('Nơi cấp',
                    'CỤC TRƯỞNG CỤC CẢNH SÁT QUẢN LÝ HÀNH CHÍNH VỀ TRẬT TỰ XÃ HỘI'),
                _buildRowFinalResult('So sánh', 'Khuôn mặt không khớp'),
                _buildRowImage(),
              ],
            ),
          ),
        ),
        _buildAction(),
      ],
    ),
  );
}

Widget _buildRowText(String title, String value, {Color? valueColor}) {
  return Row(
    children: [
      Expanded(
        child: buildBaseText(
          title,
          textColor: Color(0xFF828282),
          textAlign: TextAlign.start,
        ),
      ),
      Expanded(
        flex: 4,
        child: buildBaseText(
          value,
          textColor: valueColor ?? AppColors.textColor(),
          textAlign: TextAlign.start,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ).paddingSymmetric(
    horizontal: AppDimens.defaultPadding,
    vertical: AppDimens.paddingVerySmall,
  );
}

Widget _buildRowFinalResult(String title, String value) {
  return Row(
    children: [
      Expanded(
        child: Container(
          width: 100,
          child: buildBaseText(
            title,
            textColor: Color(0xFF828282),
            textAlign: TextAlign.start,
          ),
        ),
      ),
      Expanded(
        flex: 4,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFDE7EA),
            borderRadius: BorderRadius.circular(AppDimens.paddingVerySmall),
          ),
          child: buildBaseText(
            value,
            textColor: Color(0xFFB35658),
            fontWeight: FontWeight.w500,
          ).paddingSymmetric(vertical: AppDimens.paddingVerySmall),
        ),
      ),
    ],
  ).paddingSymmetric(
    horizontal: AppDimens.defaultPadding,
    vertical: AppDimens.paddingVerySmall,
  );
}

Widget _buildRowImage() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildImg('', AppStr.imgFrontCard, '', () {}),
      _buildImg('', AppStr.imgFrontCard, '', () {}),
      _buildImg('', AppStr.imgFrontCard, '', () {}),
    ],
  ).paddingOnly(top: AppDimens.paddingVerySmall);
}

Widget _buildImg(
    String src, String placeHolder, String titleStr, Function function) {
  return Column(
    children: <Widget>[
      IconButton(
        iconSize: Get.size.width / 4,
        icon: Container(
          width: Get.size.width / 3,
          height: Get.size.width / 3,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.defaultPadding),
              child: Image.asset(AppStr.imgFrontCard)),
        ),
        onPressed: function as void Function()?,
      ),
      Align(
        alignment: Alignment.center,
        child: Text(
          titleStr,
          style: TextStyle(
            fontSize: AppDimens.fontSmall,
            color: AppColors.text(),
          ),
        ),
      ),
    ],
  );
}

Widget _buildAction() {
  return Row(
    children: [
      Expanded(
          child: BaseButton.buildButton(
        AppStr.edit.toUpperCase().tr,
        () {
          Get.toNamed(Routes.routeCheckBasicInfo);
        },
        colors: AppColors.colorOrangeBtn,
      )),
      SizedBox(width: AppDimens.paddingVerySmall),
      Expanded(
          child: BaseButton.buildButton(
        AppStr.goHome.toUpperCase().tr,
        () {
          Get.toNamed(Routes.routeLogin);
        },
        colors: AppColors.colorPurpleBtn,
      )),
    ],
  ).paddingOnly(
    left: AppDimens.paddingVerySmall,
    right: AppDimens.paddingVerySmall,
    bottom: AppDimens.paddingVerySmall,
  );
}
