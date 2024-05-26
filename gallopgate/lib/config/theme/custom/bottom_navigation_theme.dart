import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

abstract class GNavigationBarTheme {
  static const light = NavigationBarThemeData(
    backgroundColor: GColor.surfaceLight,
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    indicatorColor: Colors.transparent,
  );
  static const dark = NavigationBarThemeData(
    elevation: 0,
    backgroundColor: GColor.surfaceDark,
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    indicatorColor: Colors.transparent,
  );
}
