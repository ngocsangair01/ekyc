import 'dart:convert';
import 'dart:typed_data';

import 'package:ekyc/base/widget/base_get_widget.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hex/hex.dart';
import 'package:intl/intl.dart';

import '../../../widgets/base/base_button.dart';
import '../../../widgets/base/base_widget.dart';
import '../../model/text_input_model.dart';
import '../../utils_widget.dart';
import 'nfc_result_controller.dart';

part 'nfc_result_widget.dart';

class NfcResultPage extends BaseGetWidget {
  const NfcResultPage({Key? key}) : super(key: key);

  @override
  NfcResultController get controller => Get.put(NfcResultController());

  @override
  Widget buildWidgets() {
    return buildBody();
  }

  Widget buildBody() {
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
                    _buildTitle(),
                    _buildDivider(),
                    _buildListGuild(controller),
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
