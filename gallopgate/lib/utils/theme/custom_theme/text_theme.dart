import 'package:flutter/material.dart';

import '../../constraints/_constraints_library.dart';

class GTextTheme {
  const GTextTheme._();

  static TextTheme get light => TextTheme(
        /// ----- DISPLAY -----
        displayLarge: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontBold,
        ),
        displayMedium: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontMdBold,
        ),
        displaySmall: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontLight,
        ),

        /// ----- TITLE -----
        titleLarge: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontMdBold,
        ),
        titleMedium: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontMdBold,
        ),
        titleSmall: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontSm,
          fontWeight: GSizes.fontLight,
        ),

        /// ----- BODY -----
        bodyLarge: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontLight,
        ),
        bodyMedium: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontLight,
        ),
        bodySmall: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontSm,
          fontWeight: GSizes.fontLight,
        ),

        /// ----- LABEL -----
        labelLarge: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontMdBold,
        ),
        labelMedium: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontMdBold,
        ),
        labelSmall: const TextStyle().copyWith(
          color: GColor.lightTextColor,
          fontSize: GSizes.fontSm,
          fontWeight: GSizes.fontLight,
        ),
      );

  static TextTheme get dark => TextTheme(
        /// ----- DISPLAY -----
        displayLarge: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontBold,
        ),
        displayMedium: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontMdBold,
        ),
        displaySmall: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontLight,
        ),

        /// ----- TITLE -----
        titleLarge: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontMdBold,
        ),
        titleMedium: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontMdBold,
        ),
        titleSmall: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontSm,
          fontWeight: GSizes.fontLight,
        ),

        /// ----- BODY -----
        bodyLarge: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontLight,
        ),
        bodyMedium: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontLight,
        ),
        bodySmall: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontSm,
          fontWeight: GSizes.fontLight,
        ),

        // --- Label --- //
        labelLarge: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontMdBold,
        ),
        labelMedium: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontMdBold,
        ),
        labelSmall: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontSm,
          fontWeight: GSizes.fontLight,
        ),

        // --- Headline --- //
        headlineLarge: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontLight,
        ),
        headlineSmall: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontSm,
          fontWeight: GSizes.fontLight,
        ),
        headlineMedium: const TextStyle().copyWith(
          color: GColor.darkTextColor,
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontLight,
        ),
      );
}
