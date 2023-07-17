import 'package:ekyc/base/base.dart';
import 'package:ekyc/features/qr_code/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/const.dart';
import '../../routes/app_routes.dart';
import '../../widgets/base/base.dart';
import '../utils_widget.dart';

class QRGuidePage extends BaseGetWidget {
  const QRGuidePage({Key? key}) : super(key: key);

  QRController get controller => Get.put(QRController());
  @override
  Widget buildWidgets() {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.colorEKYC(),
      appBar: buildAppBar(
        showActions: false,
        backgroundColor: AppColors.colorEKYC(),
        iconColor: AppColors.bg(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppStr.imgBg2), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildListImage(),
                    _buildTitle(),
                    _buildDivider(),
                    _buildListGuild(),
                    _buildDivider(),
                  ],
                ),
              ),
            ),
            _buildAction(controller),
          ],
        ),
      ),
    );
  }
}

Widget _buildListImage() {
  return Center(
    child: Icon(
      Icons.qr_code,
      color: Colors.white,
      size: AppDimens.sizeImageMedium,
    ),
  ).paddingOnly(bottom: AppDimens.paddingSmall);
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
        'Quét QR code',
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
      _buildItemText(
          'Do QR ở thẻ căn cước khá nhỏ, nên vui lòng làm theo hướng dẫn dưới đây'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText('Đặt QR vào trong ô có khoanh đỏ'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText(
          'Di chuyển QR ra xa hoặc lại gần camera sao cho camera hiện rõ QR'),
      SizedBox(height: AppDimens.paddingVerySmall),
      _buildItemText(
          'Sau khi QR hiện rõ trên camera, bật flash để có thể nhìn rõ QR hơn'),
      SizedBox(
        height: AppDimens.paddingVerySmall,
      ),
      _buildItemText(
          'Nếu chưa nhận biết được QR, vui lòng tắt flash đi rồi bật lại đến khi thành công'),
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

Widget _buildDivider() {
  return BaseWidget.buildDivider(
    color: AppColors.colorGreyEKYC(),
    indent: AppDimens.defaultPadding,
    thickness: 0.5,
  ).paddingSymmetric(vertical: AppDimens.paddingVerySmall);
}

Widget _buildAction(QRController controller) {
  return Column(
    children: [
      BaseButton.buildButton(
        AppStr.start.toUpperCase().tr,
        () {
          controller.scanBarcode();
        },
        colors: AppColors.colorOrangeBtn,
      ).paddingSymmetric(horizontal: AppDimens.paddingMedium),
      TextButton(
        onPressed: (() {
          Get.toNamed(Routes.routeGuideTakePicture);
        }),
        child: Text("Bỏ qua"),
      ),
    ],
  );
}
