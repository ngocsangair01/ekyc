part of 'qr_page.dart';

Widget buildQrView(QRController controller) {
  var scanArea = 150.0;
  return QRView(
    key: controller.qrKey,
    onQRViewCreated: controller.onQRViewCreated,
    overlay: QrScannerOverlayShape(
      borderColor: Colors.red,
      borderRadius: 10,
      borderLength: 30,
      borderWidth: 10,
      cutOutSize: scanArea,
    ),
    onPermissionSet: (ctrl, p) => controller.onPermissionSet(ctrl, p),
  );
}
