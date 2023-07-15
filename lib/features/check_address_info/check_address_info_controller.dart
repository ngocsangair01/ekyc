import 'package:ekyc/base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../application/app_controller.dart';
import '../../routes/app_routes.dart';
import '../model/image_path_model.dart';
import '../model/response_ekyc.dart';

class CheckAddressInfoController extends BaseGetxController {
  final formKey = GlobalKey<FormState>();
  final AppController appController = Get.find<AppController>();

  final TextEditingController addressController = TextEditingController();

  final FocusNode addressNode = FocusNode();

  RxInt currentAddressLength = 0.obs;

  RxBool isTrue = true.obs;

  RxString province = ''.obs;
  RxString district = ''.obs;
  RxString ward = ''.obs;

  String codeProvince = '';
  String codeDistrict = '';

  late DataOcrModel dataOrcModel;

  @override
  void onInit() {
    super.onInit();
    dataOrcModel = Get.arguments;
    fillAddress();
  }

  void fillAddress() {
    List<String> homeTown = dataOrcModel
        .responseEkyc!.frontCardResponse!.data!.homeTown!
        .split(',');
    province.value = homeTown[2].trim();
    district.value = homeTown[1].trim();
    ward.value = homeTown[0].trim();
    addressController.text =
        dataOrcModel.responseEkyc!.frontCardResponse!.data!.address!.trim();
    currentAddressLength.value = addressController.text.length;
  }

  void confirmNext() {
    if (formKey.currentState!.validate()) {
      appController.dataOcrModel = DataOcrModel(ImagePath(), ResponseEkyc());
      Get.offAllNamed(Routes.routeLogin);
    }
  }
}
