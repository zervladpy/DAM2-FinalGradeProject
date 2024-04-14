import 'package:flutter/material.dart';

import '../../constraints/_constraints_library.dart';

class GIconButtonTheme {
  const GIconButtonTheme._();

  static IconButtonThemeData get light => IconButtonThemeData(
        style: IconButton.styleFrom(
          // --- Color --- //
          foregroundColor: GColor.lightBackground,
          backgroundColor: GColor.transparent,

          // --- Padding --- //
          padding: EdgeInsets.symmetric(
            vertical: GSizes.sm,
            horizontal: GSizes.sm,
          ),

          // --- Shape --- //
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
          ),
        ),
      );

  static IconButtonThemeData get dark => IconButtonThemeData(
        style: IconButton.styleFrom(
          // --- Color --- //
          foregroundColor: GColor.darkTextColor,
          backgroundColor: GColor.transparent,

          // --- Padding --- //
          padding: EdgeInsets.symmetric(
            vertical: GSizes.sm,
            horizontal: GSizes.sm,
          ),

          // --- Shape --- //
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
          ),
        ),
      );
}
