import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class GRouter {

  GRouter();

  final rootNavigationKey = GlobalKey<NavigatorState>();
  final bottomNavigationKey = GlobalKey<NavigatorState>();

  final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      // --- ONLY Web Routes --- //
      
      // --- Rest Routes --- //
      
    ],
  );
}