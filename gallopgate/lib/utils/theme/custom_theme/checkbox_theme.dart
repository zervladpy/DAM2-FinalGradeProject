import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';

/// A class that defines the theme data for the [Checkbox] widget
class GCheckBoxTheme {
  const GCheckBoxTheme._();

  /// The light theme for the [Checkbox] widget
  static CheckboxThemeData get light => CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusSm),
        ),
        checkColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? GColor.lightBackground
              : GColor.lightBackground,
        ),
        fillColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? GColor.darkBackground
              : GColor.lightBackground,
        ),
        splashRadius: 0.0,
        side: BorderSide(
          color: GColor.darkBackground,
          width: GSizes.defaultBorderSide,
        ),
      );

  /// The dark theme for the [Checkbox] widget
  static CheckboxThemeData get dark => CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GSizes.borderRadiusSm),
        ),
        checkColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? GColor.lightBackground
              : GColor.primary,
        ),
        fillColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? GColor.primary
              : GColor.darkBackground,
        ),
        splashRadius: 0.0,
        side: BorderSide(
          color: GColor.darkBackground,
          width: GSizes.defaultBorderSide,
        ),
      );
}
