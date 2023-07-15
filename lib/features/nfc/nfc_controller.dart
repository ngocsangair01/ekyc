import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dmrtd/dmrtd.dart';
import 'package:dmrtd/extensions.dart';
import 'package:ekyc/features/nfc/mrtd_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../application/app_controller.dart';
import '../../base/controller/base_controller.dart';
import '../../routes/app_routes.dart';
import '../../utils/permission.dart';
import '../../utils/show_popup.dart';
import '../liveness/ekyc_repository.dart';

class NfcController extends BaseGetxController {
  final AppController appController = Get.find<AppController>();
  String? idDocument;
  DateTime? dateOfBirth;
  DateTime? dateOfExpiry;
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
    final backCardMrz =
        appController.dataOcrModel.responseEkyc?.backCardResponse?.data?.mrz;
    if (backCardMrz != null) {
      idDocument = backCardMrz.idNumber.toString().substring(3);
      dateOfBirth = getDate(backCardMrz.dobYymmdd ?? "");
      dateOfExpiry = getDate(backCardMrz.expYymmdd ?? "");
    }
  }

  DateTime? getDate(String date) {
    if (date.isEmpty) {
      return null;
    }
    String year = '20${date.substring(0, 2)}'; // Lấy năm từ chuỗi
    String month = date.substring(2, 4); // Lấy tháng từ chuỗi
    String day = date.substring(4); // Lấy ngày từ chuỗi

    String formattedDate =
        '$year-$month-$day'; // Kết hợp thành chuỗi theo định dạng yyyy-MM-dd

    // Chuyển đổi chuỗi thành DateTime
    DateTime dateTime = DateFormat('yyyy-MM-dd').parse(formattedDate);
    return dateTime;
  }

  Future<void> readMRTD() async {
    try {
      await nfc.connect(
          timeout: Duration(seconds: 10),
          iosAlertMessage: "Hold your phone near Biometric Passport");
      isReading.value = true;
      final passport = Passport(nfc);
      nfc.setIosAlertMessage("Trying to read EF.CardAccess ...");
      final mrtdDataTemp = MrtdData();
      try {
        mrtdDataTemp.cardAccess = await passport.readEfCardAccess();
      } on PassportError {
        //if (e.code != StatusWord.fileNotFound) rethrow;
      }
      nfc.setIosAlertMessage("Trying to read EF.CardSecurity ...");

      try {
        mrtdDataTemp.cardSecurity = await passport.readEfCardSecurity();
      } on PassportError {
        // if (e.code != StatusWord.fileNotFound) rethrow;
      }

      nfc.setIosAlertMessage("Initiating session ...");
      final bacKeySeed = DBAKeys(idDocument ?? "",
          dateOfBirth ?? DateTime.now(), dateOfExpiry ?? DateTime.now());
      await passport.startSession(bacKeySeed);

      nfc.setIosAlertMessage(formatProgressMsg("Reading EF.COM ...", 0));
      mrtdDataTemp.com = await passport.readEfCOM();

      nfc.setIosAlertMessage(formatProgressMsg("Reading Data Groups ...", 20));

      if (mrtdDataTemp.com!.dgTags.contains(EfDG1.TAG)) {
        mrtdDataTemp.dg1 = await passport.readEfDG1();
      }

      if (mrtdDataTemp.com!.dgTags.contains(EfDG2.TAG)) {
        mrtdDataTemp.dg2 = await passport.readEfDG2();
      }
      if (mrtdDataTemp.com!.dgTags.contains(EfDG14.TAG)) {
        mrtdDataTemp.dg14 = await passport.readEfDG14();
      }
      if (mrtdDataTemp.com!.dgTags.contains(EfDG15.TAG)) {
        mrtdDataTemp.dg15 = await passport.readEfDG15();
        nfc.setIosAlertMessage(formatProgressMsg("Doing AA ...", 60));
        mrtdDataTemp.aaSig = await passport.activeAuthenticate(Uint8List(8));
      }
      nfc.setIosAlertMessage(formatProgressMsg("Reading EF.SOD ...", 80));
      mrtdDataTemp.sod = await passport.readEfSOD();
      mrtdData?.value = mrtdDataTemp;
      appController.userModel.code =
          mrtdDataTemp.dg1?.mrz.optionalData.substring(0, 12);
      appController.userModel.firstName = mrtdDataTemp.dg1?.mrz.firstName;
      appController.userModel.lastName = mrtdDataTemp.dg1?.mrz.lastName;
      appController.userModel.country = mrtdDataTemp.dg1?.mrz.country;
      appController.userModel.gender = mrtdDataTemp.dg1?.mrz.gender;
      appController.userModel.dateOfBirth =
          mrtdDataTemp.dg1?.mrz.dateOfBirth.toString();
      appController.userModel.dateOfExpiry =
          mrtdDataTemp.dg1?.mrz.dateOfExpiry.toString();
      appController.userModel.nationality = mrtdDataTemp.dg1?.mrz.nationality;
      appController.userModel.image =
          mrtdDataTemp.dg2?.toBytes().base64().substring(112);
      appController.userModel.digitalSignatural =
          mrtdDataTemp.dg14?.toBytes().base64();
      appController.userModel.dg15 = mrtdDataTemp.dg15?.toBytes().base64();
    } catch (e) {
      alertMsg.value = "Đã có lỗi xảy ra, vui lòng thử lại";
      final se = e.toString().toLowerCase();
      if (e is PassportError) {
        if (se.contains("security status not satisfied")) {
          alertMsg.value =
              "Failed to initiate session with passport.\nCheck input data!";
        }
      }

      if (se.contains('timeout')) {
        alertMsg.value = "Timeout while waiting for Passport tag";
      } else if (se.contains("tag was lost")) {
        alertMsg.value = "Tag was lost. Please try again!";
      } else if (se.contains("invalidated by user")) {
        alertMsg.value = "";
      }
      if (!GetPlatform.isIOS) {
        showSnackBar(alertMsg.value);
      }
    } finally {
      await nfc.disconnect();

      // if (alertMsg.value.isNotEmpty) {
      //   await nfc.disconnect(iosErrorMessage: alertMsg.value);
      // } else {
      //   await nfc.disconnect(
      //       iosAlertMessage: formatProgressMsg("Finished", 100));
      // }
      // alertMsg.value = "Đã hoàn thành";
      // showSnackBar(alertMsg.value);
      isReading.value = false;
    }
  }

  void navToLivenessPage() async {
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
}
