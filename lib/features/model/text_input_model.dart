import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextInputModel {
  IconData? icon;
  String? hintText;
  TextEditingController? textEditingController;
  FocusNode? focusNode;
  RxInt? currentLength;
  int? maxLength;
  bool? isEmail;
  bool isPassword;
  bool? isValidated;

  TextInputModel(
      {this.icon,
      this.hintText,
      this.textEditingController,
      this.focusNode,
      this.currentLength,
      this.maxLength,
      this.isEmail = false,
      this.isPassword = false,
      this.isValidated = false});
}
