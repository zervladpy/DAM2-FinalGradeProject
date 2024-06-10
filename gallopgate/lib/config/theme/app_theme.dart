import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/custom/appbar_theme.dart';
import 'package:gallopgate/config/theme/custom/bottom_navigation_theme.dart';
import 'package:gallopgate/config/theme/custom/eleveated_button_theme.dart';
import 'package:gallopgate/config/theme/custom/icon_button_theme.dart';
import 'package:gallopgate/config/theme/custom/navigation_rail_theme.dart';
import 'package:gallopgate/config/theme/custom/outlined_button_theme.dart';
import 'package:gallopgate/config/theme/custom/tabbar_theme.dart';
import 'package:gallopgate/config/theme/custom/text_button_theme.dart';
import 'package:gallopgate/config/theme/custom/text_input_theme.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

class AppTheme {
  const AppTheme();

  ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        inputDecorationTheme: GTextInputTheme.light,
        elevatedButtonTheme: GElevatedButtonTheme.light,
        outlinedButtonTheme: GOutlinedButtonTheme.light,
        textButtonTheme: GTextButtonTheme.light,
        iconButtonTheme: GIconButtonTheme.light,
        navigationBarTheme: GNavigationBarTheme.light,
        appBarTheme: GAppbarTheme.light,
        navigationRailTheme: GNavigationRailTheme.light,
        tabBarTheme: GTabBarTheme.light,
        scaffoldBackgroundColor: GColor.surfaceLight,
      );

  ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        inputDecorationTheme: GTextInputTheme.dark,
        elevatedButtonTheme: GElevatedButtonTheme.dark,
        textButtonTheme: GTextButtonTheme.dark,
        iconButtonTheme: GIconButtonTheme.dark,
        navigationBarTheme: GNavigationBarTheme.dark,
        appBarTheme: GAppbarTheme.dark,
        navigationRailTheme: GNavigationRailTheme.dark,
        tabBarTheme: GTabBarTheme.dark,
        scaffoldBackgroundColor: GColor.surfaceDark,
      );
}
