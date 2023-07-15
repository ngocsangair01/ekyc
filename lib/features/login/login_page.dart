import 'package:ekyc/base/widget/base_get_widget.dart';
import 'package:ekyc/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../widgets/base/base_button.dart';
import '../model/text_input_model.dart';
import '../utils_widget.dart';
import 'login_controller.dart';

part 'login_widget.dart';

class LoginPage extends BaseGetWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginController get controller => Get.put(LoginController());

  @override
  Widget buildWidgets() {
    return buildBody();
  }

  Widget buildBody() {
    return Scaffold(
      backgroundColor: AppColors.colorEKYC(),
      // appBar: buildAppBar(showActions: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: 200,
              child: FittedBox(
                child: Image.asset(AppStr.imgLogoDx),
                fit: BoxFit.fill,
              ),
            ),
            _buildTitle(),
            _buildListInput(controller),
            _buildForgotPass(controller),
            _buildFooter(controller),
          ],
        ),
      ),
    );
  }
}
