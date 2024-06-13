import 'package:flutter/material.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/config/supabase/supabese_initializer.dart';
import 'package:gallopgate/ui/router/router.dart';

import 'config/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SupabeseInitializer().init();
  await LocatorInitializer().init();

  runApp(const ApplicationV2());
}

class ApplicationV2 extends StatelessWidget {
  const ApplicationV2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: const AppTheme().light,
      // darkTheme: const AppTheme().dark,
      routerConfig: ApplicationRouter.router,
    );
  }
}
