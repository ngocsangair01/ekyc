import 'package:ekyc/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseWidget {
  static int oldFunc = 0;

  static Widget buildLogo(String imgLogo, double height, {double? width}) {
    return SizedBox(
      height: height,
      child: Image.asset(
        imgLogo,
        width: width ?? Get.width,
      ),
    );
  }

  static Widget buildLoading() {
    return const CupertinoActivityIndicator();
  }

  static Widget buildDivider(
      {double height = AppDimens.padding10,
      double thickness = 1.0,
      double indent = 0.0,
      Color? color}) {
    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: indent,
      color: color ?? AppColors.dividerColor(),
    );
  }
}
