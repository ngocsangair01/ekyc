import 'package:ekyc/base/base.dart';
import 'package:ekyc/const/const.dart';
import 'package:ekyc/features/model/text_input_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils_widget.dart';
import 'create_account_controller.dart';

class CreateAccountPage extends BaseGetWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  CreateAccountController get controller => Get.put(CreateAccountController());

  @override
  Widget buildWidgets() {
    return buildScaffold();
  }

  Widget buildScaffold() {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: AppColors.bg(),
              width: Get.width,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: [
                    buildText(['Tạo', 'Tài khoản đăng nhập']),
                    buildListInput(),
                  ],
                ),
              ),
            ),
          ),
          buildFooter(AppStr.next.toUpperCase().tr, () {
            controller.confirmNext();
          }),
        ],
      ),
    );
  }

  Widget buildListInput() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          buildInput(
            TextInputModel(
              icon: Icons.person,
              hintText: 'Tài khoản đăng nhập',
              textEditingController: controller.accountController,
              focusNode: controller.accountNode,
              maxLength: 10,
              isValidated: true,
            ),
          ).paddingOnly(bottom: AppDimens.paddingVerySmall),
          buildInput(
            TextInputModel(
              icon: Icons.lock,
              hintText: 'Mật khẩu đăng nhập',
              textEditingController: controller.passwordController,
              focusNode: controller.passwordNode,
              maxLength: 10,
              isPassword: true,
              isValidated: true,
            ),
          ).paddingOnly(bottom: AppDimens.paddingVerySmall),
          buildInput(
            TextInputModel(
              icon: Icons.lock,
              hintText: 'Nhập lại mật khẩu đăng nhập',
              textEditingController: controller.repassController,
              focusNode: controller.repassNode,
              maxLength: 10,
              isPassword: true,
              isValidated: true,
            ),
          ).paddingOnly(bottom: AppDimens.paddingVerySmall),
          buildInput(
            TextInputModel(
              icon: Icons.phone,
              hintText: 'Nhập số điện thoại',
              textEditingController: controller.phoneController,
              focusNode: controller.phoneNode,
              maxLength: 10,
            ),
          ).paddingOnly(bottom: AppDimens.paddingVerySmall),
          buildInput(
            TextInputModel(
              icon: Icons.mail,
              hintText: 'Nhập email',
              textEditingController: controller.mailController,
              focusNode: controller.mailNode,
              maxLength: 10,
              isEmail: true,
            ),
          )
        ],
      ),
    ).paddingAll(AppDimens.defaultPadding);
  }
}
