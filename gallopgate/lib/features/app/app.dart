import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallopgate/utils/locale/locale.dart';
import 'package:gallopgate/utils/theme/theme.dart';

import '../../utils/constraints/colors.dart';
import '../../utils/helper/helper.dart';

/// Main App Entry Point
class GApp extends StatelessWidget {
  const GApp({super.key});

  @override
  Widget build(BuildContext context) {

    GHeleper.setSystemOverlayStyle(GColor.lightBackground);

    return MaterialApp(
      // --- Dont show debug labels --- //
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,

      // --- LOCALE --- //
      locale: GLocale.spanish,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // --- THEME --- //
      themeMode: ThemeMode.system,
      theme: GTheme.light,
      darkTheme: GTheme.dark,

      // --- ROUTER --- //
      // TODO: Create a router
    );
  }
}
