import 'package:ekyc/base/widget/base_get_widget.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/base/base_button.dart';
import '../../widgets/base/base_widget.dart';
import '../utils_widget.dart';
import 'guide_take_picture_controller.dart';

part 'guide_take_picture_widget.dart';

class GuideTakePicturePage extends BaseGetWidget {
  const GuideTakePicturePage({Key? key}) : super(key: key);

  @override
  GuideTakePictureController get controller =>
      Get.put(GuideTakePictureController());

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildTitle(),
                  _buildRowCard(),
                  _buildDivider(),
                  _buildListGuild(),
                  _buildDivider(),
                  _buildRowErrorCard(),
                ],
              ),
            ),
          ),
          _buildAction(controller),
        ],
      ),
    );
  }
}
