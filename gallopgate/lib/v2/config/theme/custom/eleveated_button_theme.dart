import 'package:flutter/material.dart';
import 'package:gallopgate/v1/config/extension/double.dart';

class GElevatedButtonTheme {
  const GElevatedButtonTheme._();

  static RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: 8.0.borderRadius,
  );

  static ElevatedButtonThemeData get light => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(shape: shape),
      );
  static ElevatedButtonThemeData get dark => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: shape,
        ),
      );
}
