import 'package:ekyc/base/widget/base_get_widget.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/base/base_widget.dart';
import '../utils_widget.dart';
import 'choose_doc_controller.dart';

part 'choose_doc_widget.dart';

class ChooseDocPage extends BaseGetWidget {
  const ChooseDocPage({Key? key}) : super(key: key);

  @override
  ChooseDocController get controller => Get.put(ChooseDocController());

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
      body: SizedBox(
        width: Get.width,
        child: Column(
          children: [
            _buildTitle(),
            _listDoc(controller),
            // Container(
            //   width: Get.width,
            //   height: 200,
            //   child: FittedBox(
            //     child: Image.asset(AppStr.imgLogoDx),
            //     fit: BoxFit.fill,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
