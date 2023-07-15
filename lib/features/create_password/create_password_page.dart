import 'package:ekyc/base/base.dart';
import 'package:ekyc/const/const.dart';
import 'package:ekyc/features/model/text_input_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils_widget.dart';
import 'create_password_controller.dart';

class CreatePasswordPage extends BaseGetWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  CreatePasswordController get controller =>
      Get.put(CreatePasswordController());

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
                    buildProgress(AppDimens.paddingOddSmallest, 90),
                    buildText(['Tạo', 'Mật khẩu đăng nhập']),
                    buildListInput(),
                    buildHint(hintText())
                        .paddingOnly(top: AppDimens.defaultPadding),
                  ],
                ),
              ),
            ),
          ),
          buildFooter(AppStr.createAccount.toUpperCase().tr, () {
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
              hintText: 'Mật khẩu đăng nhập',
              textEditingController: controller.passController,
              focusNode: controller.passNode,
              isPassword: true,
            ),
          ),
          const SizedBox(height: AppDimens.padding10),
          buildInput(
            TextInputModel(
              hintText: 'Nhập lại mật khẩu đăng nhập',
              textEditingController: controller.rePassController,
              focusNode: controller.rePassNode,
              isPassword: true,
            ),
          ),
        ],
      ),
    ).paddingAll(AppDimens.defaultPadding);
  }

  Widget hintText() {
    return Expanded(
      // width: Get.width,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Mật khẩu đăng nhập cần có ít nhất: \n',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text:
                    '8 ký tự\nMột chữ viết hoa\nMột chữ số\nMột ký tự đặc biệt'),
          ],
          style: TextStyle(color: AppColors.colorTextEKYC()),
        ),
      ),
    );
  }
}
