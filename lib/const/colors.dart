import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static Color bg() => Colors.white;

  static Color textColor() => Colors.black;

  static Color colorRed() => Colors.red;

  static const _lightAccentColor = Color(0xFF005993);
  static const _darkAccentColor = Color(0xFF3e4161);

  static Color accentColor() => _lightAccentColor;

  static const blueAccentColor = const Color(0xff005993);

  static Color blueAccent() => blueAccentColor;

  static Color bgDisable() => const Color(0xFFf2f6f9);

  static Color bgBtnBlue() => const Color(0xFF0074bc);

  static Color text() => const Color(0xFF111111);

  static Color dividerColor() => Colors.black12;

  static Color colorSlidingSegment() => const Color(0xFF8193A1);

  static Color baseColorShimmer() => Colors.grey[300]!;

  static Color highlightColorShimmer() => Colors.grey[200]!;

  static Color colorShimmer() => Colors.grey[300]!;

  static Color itemChoose() => const Color(0xFF005BAA);

  static Color colorCamera() => const Color(0x55000000);

  static Color colorEKYC() => const Color(0xFF1C1E66);

  static Color colorGreyEKYC() => const Color(0xFFBFBFBF);

  static Color colorTextEKYC() => const Color(0xFF8D8C92);

  static Color colorSuccess() => const Color(0xFF136C42);

  static Color colorError() => const Color(0xFFB02A37);

  static const List<Color> colorPurpleBtn = [
    Color(0xFF1C1E66),
    Color(0xFF1C1E66),
  ];

  static const List<Color> colorOrangeBtn = [
    Color(0xFFEF5C22),
    Color(0xFFD62626),
  ];

  static changeHomeStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light));
  }
}
