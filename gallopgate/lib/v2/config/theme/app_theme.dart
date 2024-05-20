import 'package:flutter/material.dart';
import 'package:gallopgate/v1/config/theme/custom/eleveated_button_theme.dart';
import 'package:gallopgate/v1/config/theme/custom/text_button_theme.dart';
import 'package:gallopgate/v1/config/theme/custom/text_input_theme.dart';

class AppTheme {
  const AppTheme();

  ThemeData get light => ThemeData(
        useMaterial3: true,
        inputDecorationTheme: GTextInputTheme.light,
        elevatedButtonTheme: GElevatedButtonTheme.light,
        textButtonTheme: GTextButtonTheme.light,
      );

  ThemeData get dark => ThemeData(
        useMaterial3: true,
        inputDecorationTheme: GTextInputTheme.dark,
        elevatedButtonTheme: GElevatedButtonTheme.dark,
        textButtonTheme: GTextButtonTheme.dark,
      );
}

class LightAppTheme {
  const LightAppTheme();
}

class DarkAppTheme {
  const DarkAppTheme();
}
