import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

class GElevatedButtonTheme {
  const GElevatedButtonTheme._();

  static RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  );

  static ElevatedButtonThemeData get light => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: shape,
          elevation: 0.0,
          splashFactory: NoSplash.splashFactory,
          backgroundColor: GColor.primaryLight,
          foregroundColor: GColor.surfaceLight,
          textStyle: const TextStyle().copyWith(
            color: GColor.surfaceLight,
          ),
        ),
      );

  static ElevatedButtonThemeData get dark => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: shape,
          elevation: 0.0,
          splashFactory: NoSplash.splashFactory,
          backgroundColor: GColor.primaryDark,
          foregroundColor: GColor.surfaceLight,
          textStyle: const TextStyle().copyWith(
            color: GColor.surfaceLight,
          ),
        ),
      );
}
