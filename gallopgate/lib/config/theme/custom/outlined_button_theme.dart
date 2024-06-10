import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

class GOutlinedButtonTheme {
  static RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  );

  static get light => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: shape,
          elevation: 0.0,
          splashFactory: NoSplash.splashFactory,
          foregroundColor: GColor.surfaceDark,
        ),
      );

  static get dark => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: shape,
          elevation: 0.0,
          splashFactory: NoSplash.splashFactory,
          foregroundColor: GColor.surfaceLight,
        ),
      );
}
