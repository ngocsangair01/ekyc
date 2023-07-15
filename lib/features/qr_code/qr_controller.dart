import 'package:ekyc/base/base.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRController extends BaseGetxController {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      result = scanData;
    });
  }

  void onPermissionSet(QRViewController ctrl, bool p) {
    if (!p) {
      showSnackBar(
        'no Permission',
      );
    }
  }
}
