import 'package:flutter/material.dart';

import '../../constraints/_constraints_library.dart';

/// Gallopgate Outliened Button Themes
class GOutlinedButtonTheme {
  const GOutlinedButtonTheme._();

  /// Light Outlined Button Theme
  static OutlinedButtonThemeData get light => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
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

  /// Dark Outlined Button Theme
  static OutlinedButtonThemeData get dark => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
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
