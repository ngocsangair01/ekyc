import 'package:ekyc/base/base.dart';
import 'package:ekyc/features/qr_code/result/qr_result_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class QRResultPage extends BaseGetWidget{
  const QRResultPage({Key? key}):super(key: key);

  QRResultController get controller => Get.put(QRResultController());
  @override
  Widget buildWidgets() {
    // TODO: implement buildWidgets
    throw UnimplementedError();
  }

}