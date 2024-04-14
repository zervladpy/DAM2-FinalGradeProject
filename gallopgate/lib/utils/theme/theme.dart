import 'package:flutter/material.dart';

import '../constraints/_constraints_library.dart';
import 'custom_theme/_custom_themes_library.dart';

/// GallopGate Theme
class GTheme {
  const GTheme._();

  /// Light Theme
  static ThemeData get light => ThemeData(
        // --- Brightness -- //
        brightness: Brightness.light,
        // --- Use Material -- //
        useMaterial3: true,
        // --- Color --- //
        primaryColor: GColor.darkBackground,
        scaffoldBackgroundColor: GColor.lightBackground,
        // --- Font --- //
        fontFamily: GFonts.roboto,
        // --- Custom Themes --- //
        textTheme: GTextTheme.light,
        appBarTheme: GAppBarTheme.light,
        navigationBarTheme: GNavigationBarTheme.light,
        elevatedButtonTheme: GElevatedButtonTheme.light,
        outlinedButtonTheme: GOutlinedButtonTheme.light,
        textButtonTheme: GTextButtonTheme.light,
        iconButtonTheme: GIconButtonTheme.light,
        inputDecorationTheme: GInputTheme.light,
        checkboxTheme: GCheckBoxTheme.light,
        cardTheme: GCardTheme.light,
        dividerTheme: GDividerTheme.light,
        listTileTheme: GlistTimeTheme.light,
        tabBarTheme: GTabBarTheme.light,
        drawerTheme: GDrawerTheme.light,
        iconTheme: GIconTheme.light,
      );

  /// Dark Theme
  static ThemeData get dark => ThemeData(
        // --- Brightness -- //
        brightness: Brightness.dark,
        // --- Use Material -- //
        useMaterial3: true,
        // --- Color --- //
        primaryColor: GColor.lightBackground,
        scaffoldBackgroundColor: GColor.darkBackground,
        // --- Font --- //
        fontFamily: GFonts.roboto,
        // --- Custom Themes --- //
        textTheme: GTextTheme.dark,
        appBarTheme: GAppBarTheme.dark,
        navigationBarTheme: GNavigationBarTheme.dark,
        elevatedButtonTheme: GElevatedButtonTheme.dark,
        outlinedButtonTheme: GOutlinedButtonTheme.dark,
        textButtonTheme: GTextButtonTheme.dark,
        iconButtonTheme: GIconButtonTheme.dark,
        inputDecorationTheme: GInputTheme.dark,
        checkboxTheme: GCheckBoxTheme.dark,
        cardTheme: GCardTheme.dark,
        dividerTheme: GDividerTheme.dark,
        listTileTheme: GlistTimeTheme.dark,
        tabBarTheme: GTabBarTheme.dark,
        drawerTheme: GDrawerTheme.dark,
        iconTheme: GIconTheme.dark,
      );
}
