import 'package:ekyc/base/base.dart';
import 'package:ekyc/features/qr_code/user_information.dart';
import 'package:ekyc/routes/app_routes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class QRController extends BaseGetxController {
  String? barcodeController;
  String? idIdentity;
  String? information;
  UserInformation userInformation = UserInformation();
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Quay lại",
        true,
        ScanMode.QR,
      );

      ///mặc định barcode khi cancel sẽ trả về -1 nên sẽ gán bằng rỗng
      if (barcodeScanRes.compareTo("-1") == 0) {
        barcodeController = "";
      } else {
        getData(barcodeScanRes);
        Get.toNamed(Routes.routeQRResultPage, arguments: userInformation);
      }
    } on PlatformException {
      barcodeScanRes = "Đã có lỗi xảy ra";
    }
  }

  void getData(String barcodeScanRes) {
    barcodeController = barcodeScanRes;
    idIdentity = barcodeController?.substring(0, 12);
    information = barcodeController?.substring(14);
    List<String> splitStrings = information?.split("|") ?? [];
    for (var i = 0; i < splitStrings.length; i++) {
      userInformation.name = splitStrings[0];
      userInformation.birthday = splitStrings[1];
      userInformation.gender = splitStrings[2];
      userInformation.address = splitStrings[3];
      userInformation.createDate = splitStrings[4];
    }
  }
}
