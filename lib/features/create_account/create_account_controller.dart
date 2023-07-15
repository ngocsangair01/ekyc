import 'package:ekyc/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class CreateAccountController extends BaseGetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController accountController = TextEditingController();
  final FocusNode accountNode = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repassController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mailController = TextEditingController();

  RxInt currentAccountLength = 0.obs;
  final FocusNode passwordNode = FocusNode();
  final FocusNode repassNode = FocusNode();
  final FocusNode phoneNode = FocusNode();
  final FocusNode mailNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
  }

  void confirmNext() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(Routes.routeConfirmOtp);
    }
  }
}
