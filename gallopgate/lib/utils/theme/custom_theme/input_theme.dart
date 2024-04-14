import 'package:flutter/material.dart';

import '../../constraints/_constraints_library.dart';

/// Custom theme for InputDecoration
class GInputTheme {
  const GInputTheme._();

  /// Light theme for InputDecoration
  static InputDecorationTheme get light => InputDecorationTheme(
        alignLabelWithHint: true,
        errorMaxLines: 3,

        // --- Colors --- //
        prefixIconColor: GColor.darkBackground,
        suffixIconColor: GColor.darkBackground,

        // --- Content Padding --- //
        contentPadding: EdgeInsets.symmetric(
          horizontal: GSizes.sm,
          vertical: GSizes.md,
        ),
        // --- Font Styles --- //
        labelStyle: const TextStyle().copyWith(
          color: GColor.darkBackground,
        ),
        floatingLabelStyle: const TextStyle().copyWith(
          color: GColor.darkBackground,
          fontSize: GSizes.fontLg,
        ),
        hintStyle: const TextStyle().copyWith(
          color: GColor.darkBackground.withOpacity(0.4),
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontLight,
        ),
        errorStyle: const TextStyle().copyWith(
          color: GColor.error,
          fontSize: GSizes.fontMd,
        ),
        // --- Border Styles --- //
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          borderSide: BorderSide(
            color: GColor.darkBackground,
            strokeAlign: GSizes.zero,
            style: BorderStyle.solid,
            width: GSizes.defaultBorderSide,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          borderSide: BorderSide(
            color: GColor.darkBackground,
            width: GSizes.focusedBorderSide,
            style: BorderStyle.solid,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          borderSide: BorderSide(
            color: GColor.error,
            width: GSizes.defaultBorderSide,
            style: BorderStyle.solid,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          borderSide: BorderSide(
            color: GColor.error,
            width: GSizes.focusedBorderSide,
            style: BorderStyle.solid,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          borderSide: BorderSide(
            color: GColor.darkBackground.withOpacity(0.2),
            width: GSizes.defaultBorderSide,
          ),
        ),
      );

  /// Dark theme for InputDecoration
  static InputDecorationTheme get dark => InputDecorationTheme(
        alignLabelWithHint: true,
        errorMaxLines: 3,

        // --- Colors --- //
        prefixIconColor: GColor.lightBackground,
        suffixIconColor: GColor.lightBackground,

        // --- Content Padding --- //
        contentPadding: EdgeInsets.symmetric(
          horizontal: GSizes.sm,
          vertical: GSizes.md,
        ),
        // --- Font Styles --- //
        labelStyle: const TextStyle().copyWith(
          color: GColor.lightBackground,
        ),
        floatingLabelStyle: const TextStyle().copyWith(
          color: GColor.lightBackground,
          fontSize: GSizes.fontLg,
        ),
        hintStyle: const TextStyle().copyWith(
          color: GColor.lightBackground.withOpacity(0.4),
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontLight,
        ),
        errorStyle: const TextStyle().copyWith(
          color: GColor.error,
          fontSize: GSizes.fontMd,
        ),
        // --- Border Styles --- //
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          borderSide: BorderSide(
            color: GColor.lightBackground,
            strokeAlign: GSizes.zero,
            style: BorderStyle.solid,
            width: GSizes.defaultBorderSide,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          borderSide: BorderSide(
            color: GColor.lightBackground,
            width: GSizes.focusedBorderSide,
            style: BorderStyle.solid,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          borderSide: BorderSide(
            color: GColor.error,
            width: GSizes.defaultBorderSide,
            style: BorderStyle.solid,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          borderSide: BorderSide(
            color: GColor.error,
            width: GSizes.focusedBorderSide,
            style: BorderStyle.solid,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          borderSide: BorderSide(
            color: GColor.lightBackground.withOpacity(0.2),
            width: GSizes.defaultBorderSide,
          ),
        ),
      );
}
