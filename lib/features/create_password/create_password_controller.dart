import 'package:ekyc/base/base.dart';
import 'package:ekyc/utils/show_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../const/string_value.dart';
import '../../routes/app_routes.dart';

class CreatePasswordController extends BaseGetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController passController = TextEditingController();
  final TextEditingController rePassController = TextEditingController();
  final FocusNode passNode = FocusNode();
  final FocusNode rePassNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
  }

  void confirmNext() {
    if (formKey.currentState!.validate()) {
      if (passController.text.trim() != rePassController.text.trim()) {
        ShowPopup.showDialogNotification('Nhập lại mật khẩu không chính xác!');
      } else {
        Get.offNamedUntil(Routes.routeComplete, (route) => false);
      }
    }
  }
}
