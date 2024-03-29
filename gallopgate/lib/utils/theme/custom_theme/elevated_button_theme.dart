import 'package:flutter/material.dart';

import '../../constraints/_constraints_library.dart';

// Gallopgate Theme for ElevatedButton
class GElevatedButtonTheme {
  const GElevatedButtonTheme._();

  static ElevatedButtonThemeData get light => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // --- Color --- //
          foregroundColor: GColor.darkTextColor,
          backgroundColor: GColor.darkBackground,
          // --- Padding --- //
          padding: EdgeInsets.symmetric(
            vertical: GSizes.sm,
            horizontal: GSizes.md,
          ),
          // --- Text Style --- //
          textStyle: const TextStyle().copyWith(
            color: GColor.lightTextColor,
            fontSize: GSizes.md,
          ),
          // --- Shape --- //
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
          ),
        ),
      );

  static ElevatedButtonThemeData get dark => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          // --- Color --- //
          backgroundColor: GColor.primary,
          foregroundColor: GColor.darkTextColor,
          // --- Padding --- //
          padding: EdgeInsets.symmetric(
            vertical: GSizes.sm,
            horizontal: GSizes.md,
          ),
          // --- Text Style --- //
          textStyle: const TextStyle().copyWith(
            color: GColor.darkTextColor,
            fontSize: GSizes.md,
            fontWeight: GSizes.fontMdBold,
          ),
          // --- Shape --- //
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
          ),
        ),
      );
}
