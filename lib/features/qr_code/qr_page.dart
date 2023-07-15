import 'package:ekyc/base/base.dart';
import 'package:ekyc/features/qr_code/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../const/const.dart';
import '../utils_widget.dart';

part 'qr_widget.dart';

class QRPage extends BaseGetWidget{
  const QRPage({Key? key}): super(key: key);
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

