import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

abstract class GIconButtonTheme {
  static IconButtonThemeData light = IconButtonThemeData(
    style: IconButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      foregroundColor: GColor.surfaceLight,
    ),
  );

  static IconButtonThemeData dark = IconButtonThemeData(
    style: IconButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      foregroundColor: GColor.surfaceLight,
    ),
  );
}
