import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

abstract class GThemeUtils {
  static bool isDarkMode(context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color getTextColor(context) =>
      isDarkMode(context) ? GColor.surfaceLight : GColor.surfaceDark;

  static Color getPrimaryColor(context) =>
      isDarkMode(context) ? GColor.primaryDark : GColor.primaryLight;
}
