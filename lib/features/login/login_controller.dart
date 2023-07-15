import 'package:ekyc/features/login/token_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../application/app_controller.dart';
import '../../base/controller/base_controller.dart';
import '../../const/constants/app_key.dart';
import '../../routes/app_routes.dart';
import '../../utils/keyboard.dart';
import 'login_repository.dart';
import 'login_request_model.dart';

class LoginController extends BaseGetxController {
  final formKey = GlobalKey<FormState>();
  final LoginRequestModel? loginRequestModel = LoginRequestModel();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode accountNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  late final LoginRepository loginRepository;

  RxInt currentAccountLength = 0.obs;
  RxInt currentPasswordLength = 0.obs;

  RxBool checkBoxValue = false.obs;

  @override
  void onInit() {
    super.onInit();
    loginRepository = LoginRepository(this);
    // getToken();
  }

  Future<void> navToChooseDoc() async {
    KeyBoard.hide();
    if (formKey.currentState!.validate()) {
      try {
        await getToken().then(
          (Value) {
            Get.offNamed(Routes.routeChooseDoc);
            showSnackBar("Đăng nhập thành công");
          },
        );
      } catch (e) {
        showSnackBar("Đăng nhập không thành công");
      }
    }
  }

  Future<void> getToken() async {
    loginRequestModel
      ?..username = accountController.text
      ..password = passwordController.text;
    TokenModel? tokenModel = await loginRepository.getToken(
      loginRequestModel ?? LoginRequestModel(),
    );
    if (tokenModel != null) {
      HIVE_APP.put(
          AppKey.keyToken, '${tokenModel.tokenType} ${tokenModel.accessToken}');
    } else {
      showSnackBar("Đăng nhập không thành công");
    }
  }
}
