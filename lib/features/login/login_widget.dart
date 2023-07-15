part of 'login_page.dart';

Widget _buildTitle() {
  return Text(
    AppStr.loginTitle,
    style: TextStyle(
      color: AppColors.bg(),
      fontSize: AppDimens.paddingBig,
    ),
  );
}

Widget _buildListInput(LoginController controller) {
  return Form(
    key: controller.formKey,
    child: Column(
      children: [
        _buildAccount(controller),
        SizedBox(height: AppDimens.padding10),
        _buildPassword(controller),
      ],
    ),
  ).paddingAll(AppDimens.paddingSmall);
}

Widget _buildAccount(LoginController controller) {
  return buildInput(
    TextInputModel(
      hintText: 'Tên tài khoản',
      textEditingController: controller.accountController,
      focusNode: controller.accountNode,
      currentLength: controller.currentAccountLength,
      maxLength: 20,
      icon: Icons.person,
      isValidated: true,
    ),
  );
}

Widget _buildPassword(LoginController controller) {
  return buildInput(
    TextInputModel(
      hintText: 'Mật khẩu đăng nhập',
      textEditingController: controller.passwordController,
      focusNode: controller.passwordNode,
      isPassword: true,
      maxLength: 10,
      icon: Icons.lock,
      isValidated: true,
    ),
  );
}

Widget _buildForgotPass(LoginController controller) {
  return Obx(
    () => Row(
      children: [
        _buildCheckBox(controller),
        Text('Nhớ mật khẩu', style: TextStyle(color: AppColors.bg())),
        Spacer(),
        Text('Quên mật khẩu?', style: TextStyle(color: AppColors.bg())),
      ],
    ).paddingOnly(right: AppDimens.paddingSmall),
  );
}

Widget _buildCheckBox(LoginController controller) {
  return Theme(
    data: Theme.of(Get.context!).copyWith(
      unselectedWidgetColor: Colors.white,
    ),
    child: Checkbox(
      value: controller.checkBoxValue.value,
      onChanged: (value) {
        controller.checkBoxValue.toggle();
      },
      checkColor: AppColors.textColor(),
      activeColor: AppColors.bg(),
    ),
  );
}

Widget _buildFooter(LoginController controller) {
  return Column(
    children: [
      BaseButton.buildButton(
        AppStr.loginTitle.toUpperCase().tr,
        () {
          controller.navToChooseDoc();
        },
        colors: AppColors.colorOrangeBtn,
      ).paddingAll(AppDimens.paddingSmall),
      buildBaseText('Bạn chưa có tài khoản?')
          .paddingSymmetric(vertical: AppDimens.paddingSmall),
      BaseButton.buildButton(
        'Đăng ký'.toUpperCase().tr,
        () {
          Get.toNamed(Routes.routeCreateAccount);
        },
        colors: AppColors.colorOrangeBtn,
      ).paddingAll(AppDimens.paddingSmall),
    ],
  );
}
