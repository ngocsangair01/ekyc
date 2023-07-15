import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddressModel {
  RxString? text;
  String? code, value, parentCode;

  AddressModel({this.text, this.code, this.value, this.parentCode});
}
