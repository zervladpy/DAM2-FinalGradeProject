import 'package:flutter/material.dart';

import '../../constraints/_constraints_library.dart';

class GlistTimeTheme {
  const GlistTimeTheme._();

  static ListTileThemeData get light => ListTileThemeData(
        dense: true,
        textColor: GColor.lightTextColor,
        iconColor: GColor.darkTextColor.withOpacity(0.6),
        titleTextStyle: const TextStyle().copyWith(
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontMdBold,
        ),
        subtitleTextStyle: const TextStyle().copyWith(
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontMdBold,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: GSizes.sm,
          horizontal: GSizes.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GSizes.sm),
        ),
      );

  static ListTileThemeData get dark => ListTileThemeData(
        dense: true,
        titleTextStyle: const TextStyle().copyWith(
          fontSize: GSizes.fontLg,
          fontWeight: GSizes.fontMdBold,
        ),
        subtitleTextStyle: const TextStyle().copyWith(
          fontSize: GSizes.fontMd,
          fontWeight: GSizes.fontMdBold,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: GSizes.sm,
          horizontal: GSizes.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GSizes.sm),
        ),
      );
}
