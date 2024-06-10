import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

class GTextButtonTheme {
  const GTextButtonTheme._();

  static RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  );

  static TextButtonThemeData get light => TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: shape,
          foregroundColor: GColor.surfaceDark,
        ),
      );

  static TextButtonThemeData get dark => TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: shape,
          foregroundColor: GColor.surfaceLight,
        ),
      );
}
