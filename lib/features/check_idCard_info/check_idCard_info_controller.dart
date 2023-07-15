import 'package:ekyc/base/base.dart';
import 'package:ekyc/features/check_address_info/check_address_info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/image_path_model.dart';

class CheckIdCardInfoController extends BaseGetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController idCardController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final FocusNode idCardNode = FocusNode();
  final FocusNode startDateNode = FocusNode();
  final FocusNode endDateNode = FocusNode();
  final FocusNode addressNode = FocusNode();

  RxInt currentIdCardLength = 0.obs;
  RxInt currentAddressLength = 0.obs;

  late DataOcrModel dataOcrModel;

  @override
  void onInit() {
    super.onInit();
    dataOcrModel = Get.arguments;
    fillInfo();
  }

  void confirmNext() {
    if (formKey.currentState!.validate()) {
      Get.to(() => CheckAddressInfoPage(), arguments: dataOcrModel);
    }
  }

  void fillInfo() {
    idCardController.text =
        dataOcrModel.responseEkyc?.frontCardResponse?.data!.idNumber ?? '';
    startDateController.text =
        dataOcrModel.responseEkyc?.backCardResponse?.data?.dateOfIssue ?? '';
    endDateController.text =
        dataOcrModel.responseEkyc?.frontCardResponse?.data!.expired ?? '';
    addressController.text =
        '${dataOcrModel.responseEkyc?.backCardResponse?.data!.placeOfIssue ?? ''} ${dataOcrModel.responseEkyc?.backCardResponse?.data!.placeOfIssue2 ?? ''}';

    currentIdCardLength.value = idCardController.text.length;
    currentAddressLength.value = addressController.text.length;
  }
}
