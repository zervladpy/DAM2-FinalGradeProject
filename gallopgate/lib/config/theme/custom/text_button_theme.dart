import 'package:flutter/material.dart';

class GTextButtonTheme {
  const GTextButtonTheme._();

  static RoundedRectangleBorder shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8.0),
  );

  static TextButtonThemeData get light => TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: shape,
        ),
      );

  static TextButtonThemeData get dark => TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: shape,
        ),
      );
}
