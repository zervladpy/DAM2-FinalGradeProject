import 'package:flutter/material.dart';
import 'package:gallopgate/v1/config/extension/double.dart';

class GTextButtonTheme {
  const GTextButtonTheme._();

  static RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: 8.0.borderRadius,
  );

  static TextButtonThemeData get light => TextButtonThemeData(
        style: TextButton.styleFrom(shape: shape),
      );

  static TextButtonThemeData get dark => TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: shape,
        ),
      );
}
