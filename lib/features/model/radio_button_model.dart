import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RadioButtonModel {
  String? title;
  List<String>? choices;
  RxBool? isTrue;

  RadioButtonModel({
    this.title,
    this.choices,
    this.isTrue,
  });
}
