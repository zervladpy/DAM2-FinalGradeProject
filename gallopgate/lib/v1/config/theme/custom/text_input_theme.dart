import 'package:flutter/material.dart';
import 'package:gallopgate/v1/config/extension/double.dart';

class GTextInputTheme {
  const GTextInputTheme._();

  static InputDecorationTheme get light => InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: 8.0.borderRadius),
        contentPadding: 8.0.paddingAll,
      );
  static InputDecorationTheme get dark => InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: 8.0.borderRadius),
        contentPadding: 8.0.paddingAll,
      );
}
