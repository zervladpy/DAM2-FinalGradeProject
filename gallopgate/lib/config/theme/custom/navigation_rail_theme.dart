import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

abstract class GNavigationRailTheme {
  static const light = NavigationRailThemeData(
    backgroundColor: GColor.surfaceLight,
    useIndicator: true,
    groupAlignment: BorderSide.strokeAlignCenter,
    labelType: NavigationRailLabelType.selected,
    indicatorColor: Colors.transparent,
  );
  static const dark = NavigationRailThemeData(
    backgroundColor: GColor.surfaceDark,
    useIndicator: true,
    groupAlignment: BorderSide.strokeAlignCenter,
    labelType: NavigationRailLabelType.selected,
    indicatorColor: Colors.transparent,
  );
}
