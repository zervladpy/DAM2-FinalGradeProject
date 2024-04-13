import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';

class GDrawerTheme {
  const GDrawerTheme._();

  static DrawerThemeData get light => DrawerThemeData(
        backgroundColor: GColor.lightBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
        ),
      );

  static DrawerThemeData get dark => DrawerThemeData(
        backgroundColor: GColor.darkBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusLg),
        ),
      );
}
