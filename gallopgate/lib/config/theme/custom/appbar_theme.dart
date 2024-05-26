import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

abstract class GAppbarTheme {
  static const light = AppBarTheme(
    elevation: 0.0,
    scrolledUnderElevation: 0.0,
    backgroundColor: GColor.surfaceLight,
  );
  static const dark = AppBarTheme(
    elevation: 0.0,
    scrolledUnderElevation: 0.0,
    backgroundColor: GColor.surfaceDark,
  );
}
