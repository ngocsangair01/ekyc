import 'package:ekyc/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../application/app_controller.dart';
import '../check_idCard_info/check_idCard_info_page.dart';

class CheckBasicInfoController extends BaseGetxController {
  final formKey = GlobalKey<FormState>();
  final AppController appController = Get.find<AppController>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  final FocusNode nameNode = FocusNode();
  final FocusNode dobNode = FocusNode();

  RxInt currentNameLength = 0.obs;
  RxInt currentDobLength = 0.obs;

  RxBool isMale = true.obs;

  @override
  void onInit() {
    super.onInit();
    // modelTTPL = ModelTTPL(ImagePath(), ResponseEkyc());
    fillInfo();
  }

  void confirmNext() {
    if (formKey.currentState!.validate()) {
      Get.to(() => CheckIdCardInfoPage(),
              arguments: appController.dataOcrModel)!
          .then(
        (value) => () {
          print(value);
        },
      );
    }
  }

  void fillInfo() {
    nameController.text = appController
            .dataOcrModel.responseEkyc?.frontCardResponse?.data!.name ??
        '';
    dobController.text = appController
            .dataOcrModel.responseEkyc?.frontCardResponse?.data!.dateOfBirth ??
        '';
    isMale.value =
        appController.dataOcrModel.responseEkyc?.frontCardResponse?.data!.sex ==
            'Nam';

    currentNameLength.value = nameController.text.length;
  }
}
