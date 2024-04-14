import 'package:flutter/material.dart';

import '../../constraints/_constraints_library.dart';

class GCardTheme {
  const GCardTheme._();

  static CardTheme get light => CardTheme(
        elevation: 0,
        color: GColor.darkBackground,
        margin: EdgeInsets.zero,
        // --- Shape --- //
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          side: BorderSide(
            color: GColor.darkBackground,
            width: GSizes.defaultBorderSide,
          ),
        ),
      );

  static CardTheme get dark => CardTheme(
        elevation: 0,
        color: GColor.primary,
        margin: EdgeInsets.zero,
        // --- Shape --- //
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
          side: BorderSide(
            color: GColor.lightBackground,
            width: GSizes.defaultBorderSide,
          ),
        ),
      );
}
