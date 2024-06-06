import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

abstract class GTabBarTheme {
  static const light = TabBarTheme(
    splashFactory: InkSplash.splashFactory,
    indicator: BoxDecoration(
      color: GColor.primaryLight,
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    labelStyle: TextStyle(
      color: GColor.surfaceLight,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.transparent,
  );
  static const dark = TabBarTheme(
    splashFactory: InkSplash.splashFactory,
    tabAlignment: TabAlignment.start,
    indicator: BoxDecoration(
      color: GColor.primaryDark,
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    labelStyle: TextStyle(
      color: GColor.surfaceLight,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    dividerColor: Colors.transparent,
  );
}
