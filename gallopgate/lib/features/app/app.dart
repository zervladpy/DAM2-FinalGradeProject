import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallopgate/core/router/app_router.dart';
import 'package:gallopgate/utils/locale/locale.dart';
import 'package:gallopgate/utils/theme/theme.dart';
import 'package:go_router/go_router.dart';

import '../../utils/constraints/colors.dart';
import '../../utils/helper/helper.dart';

/// Main App Entry Point
class GApp extends StatelessWidget {
  const GApp({super.key});

  @override
  Widget build(BuildContext context) {
    GHelper.setSystemOverlayStyle(GColor.darkBackground);

    GoRouter router = GRouter(authCubit: context.read()).router;

    return MaterialApp.router(
      // --- Dont show debug labels --- //
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'GallopGate',

      // --- LOCALE --- //
      locale: GLocale.spanish,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // --- THEME --- //
      themeMode: ThemeMode.system,
      theme: GTheme.light,
      darkTheme: GTheme.dark,
      // --- ROUTER --- //
      routerConfig: router,
    );
  }
}
