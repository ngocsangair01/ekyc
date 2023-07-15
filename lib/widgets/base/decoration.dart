import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ekyc/const/colors.dart';
import 'package:ekyc/const/dimens.dart';

class BaseDecoration {
  factory BaseDecoration() => _singleton;

  BaseDecoration._internal();

  static BaseDecoration _singleton = BaseDecoration._internal();

  final BoxDecoration defaultBoxDecoration = BoxDecoration(
      color: AppColors.bg(),
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppDimens.defaultPadding)));
  BoxDecoration get withDefaultBoxDecoration => defaultBoxDecoration;
}
