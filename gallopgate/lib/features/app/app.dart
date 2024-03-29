import 'package:flutter/material.dart';
import 'package:gallopgate/utils/locale/locale.dart';
import 'package:gallopgate/utils/theme/theme.dart';

/// Main App Entry Point
class GApp extends StatelessWidget {
  const GApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      // --- LOCALE --- //
      supportedLocales: GLocale.all,
      locale: GLocale.spanish,

      // --- THEME --- //
      themeMode: ThemeMode.system,
      theme: GTheme.light,
      darkTheme: GTheme.dark,
    );
  }
}
