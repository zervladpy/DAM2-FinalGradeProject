import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

class GTextInputTheme {
  const GTextInputTheme._();

  static InputDecorationTheme get light => InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: const EdgeInsets.all(8.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: GColor.primaryLight,
            width: 2.0,
          ),
        ),
        labelStyle: const TextStyle().copyWith(
          color: GColor.primaryLight,
        ),
      );
  static InputDecorationTheme get dark => InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: const EdgeInsets.all(8.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: GColor.surfaceLight,
            width: 2.0,
          ),
        ),
        labelStyle: const TextStyle().copyWith(
          color: GColor.surfaceLight,
        ),
      );
}
