import 'package:flutter/material.dart';
import 'package:gallopgate/features/main_shell/main_shell_screen.dart';
import 'package:gallopgate/utils/locale/locale.dart';
import 'package:gallopgate/utils/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/constraints/colors.dart';
import '../../utils/helper/helper.dart';

/// Main App Entry Point
class GApp extends StatelessWidget {
  const GApp({super.key});

  @override
  Widget build(BuildContext context) {

    GHelper.setSystemOverlayStyle(
        GColor.darkBackground
    );

    return MaterialApp(

      // --- Dont show debug labels --- //
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,

      // --- LOCALE --- //
      locale: GLocale.spanish,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // --- THEME --- //
      themeMode: ThemeMode.dark,
      theme: GTheme.light,
      darkTheme: GTheme.dark,
      home: const MainShellScreen(),
      // --- ROUTER --- //
      // TODO: Create a router
    );
  }
}
