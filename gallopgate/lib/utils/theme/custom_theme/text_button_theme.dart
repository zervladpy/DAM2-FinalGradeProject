import 'package:flutter/material.dart';

import '../../constraints/_constraints_library.dart';

/// Custom theme for TextButton
class GTextButtonTheme {
  const GTextButtonTheme._();

  /// Light theme for TextButton
  static TextButtonThemeData get light => TextButtonThemeData(
        style: TextButton.styleFrom(
          // --- Color --- //
          foregroundColor: GColor.lightTextColor,
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

  /// Dark theme for TextButton
  static TextButtonThemeData get dark => TextButtonThemeData(
        style: TextButton.styleFrom(
          // --- Color --- //
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
          ),
          // --- Shape --- //
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
          ),
        ),
      );
}
