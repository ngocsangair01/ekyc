import 'package:ekyc/base/widget/base_get_widget.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../widgets/base/base_button.dart';
import '../../widgets/base/base_widget.dart';
import '../utils_widget.dart';
import 'nfc_controller.dart';

part 'nfc_widget.dart';

class NfcPage extends BaseGetWidget {
  const NfcPage({Key? key}) : super(key: key);

  @override
  NfcController get controller => Get.put(NfcController());

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
                    Obx(
                      () => _buildTextInitializing(controller),
                    ),
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
