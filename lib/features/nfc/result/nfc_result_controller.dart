import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:dmrtd/dmrtd.dart';
import 'package:ekyc/features/nfc/mrtd_data.dart';
import 'package:ekyc/features/nfc/result/nfc_request.dart';
import 'package:ekyc/features/take_picture/ekyc_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../application/app_controller.dart';
import '../../../base/controller/base_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/permission.dart';
import '../../../utils/show_popup.dart';
import '../../model/image_path_model.dart';
import '../nfc_avt_model.dart';

class NfcResultController extends BaseGetxController {
  final AppController appController = Get.find<AppController>();
  late EkycRepository ekycRepository;
  ImagePath imagePath = ImagePath();
  String? idDocument = '';
  String? firstName = '';
  String? lastName = '';
  String? dateOfBirth;
  String? dateOfExpiry;
  String? gender;
  String? nationality;
  String? image;
  String? digitalSignatural;
  String? dg15;
  Rx<MrtdData>? mrtdData;
  RxBool readComplete = false.obs;
  final NfcProvider nfc = NfcProvider();
  final scrollController = ScrollController();
  RxBool isReading = false.obs;
  RxString alertMsg = "Đọc cccd".obs;
  @override
  void onInit() {
    setupData();
    super.onInit();
  }

  void setupData() {
    ekycRepository = EkycRepository(this);
    idDocument = appController.userModel.code;
    firstName = appController.userModel.firstName;
    lastName = appController.userModel.lastName;
    gender = appController.userModel.gender;
    dateOfBirth = appController.userModel.dateOfBirth?.substring(0, 10);
    dateOfExpiry = appController.userModel.dateOfExpiry?.substring(0, 10);
    nationality = appController.userModel.nationality;
    image = appController.userModel.image;
    digitalSignatural = appController.userModel.digitalSignatural;
    dg15 = appController.userModel.dg15;
  }

  Future<void> navToLivenessPage() async {
    String imagePath = await saveBase64Image(image ?? '');
    ImagePath imagePathSend = ImagePath(imgAvatar: imagePath);
    NfcRequest nfcRequest = NfcRequest(
      firstName: firstName,
      lastName: lastName,
      documentNumber: idDocument,
      idNumber: "",
      gender: gender,
      country: nationality,
      nationality: nationality,
      dateOfBirthc: dateOfBirth,
      dateOfExpire: dateOfExpiry,
      caIssuer: digitalSignatural,
      caSerialNumber: dg15,
    );
    NfcAvtModelResponse response =
        await ekycRepository.sendImageAvt(nfcRequest, imagePathSend);
    PermissionStatus permissionStatus =
        await checkPermission([Permission.camera]);
    switch (permissionStatus) {
      case PermissionStatus.granted:
        {
          Get.toNamed(Routes.routeWebViewLiveness);
        }
        break;
      case PermissionStatus.permanentlyDenied:
        ShowPopup.openAppSetting();
        break;
      default:
        return;
    }
  }

  Future<String> saveBase64Image(String base64Image) async {
    final decodedBytes = base64Decode(base64Image);

    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/temp_image.png';

    final tempFile = File(tempPath);
    await tempFile.writeAsBytes(decodedBytes);

    return tempPath;
  }
}
