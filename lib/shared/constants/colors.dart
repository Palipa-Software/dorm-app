import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color sodaliteBlue = Color(0xFF25316D);
  static Color oceanNight = Color(0xFF5F6F94);
  static Color effervescentBlue = Color(0xFF002B5B);
  static Color lakeView = Color(0xFF2B4865);
  static Color seaGoddess = Color(0xFF256D85);
  static Color beachGlass = Color(0xFF8FE3CF);

  //App Dark Light Color
  static Color lightScaffoldBackgroundColor = hexToColor('#F9F9F9');
  static Color darkScaffoldBackgroundColor = hexToColor('#2F2E2E');
  static Color secondaryAppColor = hexToColor('#22DDA6');
  static Color secondaryDarkAppColor = Colors.white;
  static Color tipColor = hexToColor('#B6B6B6');
  static Color lightGray = Color(0xFFF6F6F6);
  static Color darkGray = Color(0xFF9F9F9F);
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex), 'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}
