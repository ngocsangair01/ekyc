import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_const.dart';
import 'colors.dart';
import 'dimens.dart';

abstract class AppStyle {
  const AppStyle._();

  static TextStyle headerStyleBlack = TextStyle(
      fontSize: AppDimens.fontExtraLarge,
      color: AppColors.textColor(),
      fontFamily: AppConst.fontAvertaSemibold,
      fontWeight: FontWeight.w500);

  static TextStyle headerStyleWhite = TextStyle(
    fontSize: AppDimens.fontExtraLarge,
    color: AppColors.bg(),
    fontFamily: AppConst.fontAvertaSemibold,
    fontWeight: FontWeight.bold,
  );
  static TextStyle headerStyleBlackLarge = TextStyle(
    fontSize: AppDimens.fontExtraXLarge,
    color: AppColors.textColor(),
    fontFamily: AppConst.fontAvertaSemibold,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headerStyleWhiteLarge = TextStyle(
    fontSize: AppDimens.fontExtraXLarge,
    color: AppColors.bg(),
    fontFamily: AppConst.fontAvertaSemibold,
    fontWeight: FontWeight.bold,
  );

  static TextStyle styleTextBlueLarge = TextStyle(
      fontSize: AppDimens.fontExtraLarge,
      color: AppColors.itemChoose(),
      fontFamily: AppConst.fontAvertaRegular);

  static TextStyle styleTextBlue = TextStyle(
      fontSize: AppDimens.fontLarge,
      color: AppColors.itemChoose(),
      fontFamily: AppConst.fontAvertaRegular);

  static TextStyle styleTextBlueUnderLine = TextStyle(
      fontSize: AppDimens.fontExtraLarge,
      decoration: TextDecoration.underline,
      color: AppColors.itemChoose(),
      fontFamily: AppConst.fontAvertaRegular);

  static TextStyle styleTextWhiteBtn = TextStyle(
      fontSize: AppDimens.fontExtraLarge,
      color: AppColors.bg(),
      fontFamily: AppConst.fontAvertaRegular);

  static TextStyle styleTextHintText = TextStyle(
      color: AppColors.colorSlidingSegment(),
      fontSize: AppDimens.fontLarge,
      fontWeight: FontWeight.w400,
      fontFamily: AppConst.fontAvertaRegular);
}
