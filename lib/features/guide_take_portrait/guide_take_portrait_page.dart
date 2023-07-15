import 'package:ekyc/base/widget/base_get_widget.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/base/base_button.dart';
import '../../widgets/base/base_widget.dart';
import '../utils_widget.dart';
import 'guide_take_portrait_controller.dart';

part 'guide_take_portrait_widget.dart';

class GuideTakePortraitPage extends BaseGetWidget {
  const GuideTakePortraitPage({Key? key}) : super(key: key);

  @override
  GuideTakePortraitController get controller =>
      Get.put(GuideTakePortraitController());

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
                    _buildListImage(),
                    _buildTitle(),
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
      ),
    );
  }
}
