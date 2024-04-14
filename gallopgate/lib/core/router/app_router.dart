import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/_common/controller/controller_auth/auth_cubit.dart';
import 'package:gallopgate/features/account/account_screen.dart';
import 'package:gallopgate/features/auth/login/login_screen.dart';
import 'package:gallopgate/features/auth/signup_screen.dart';
import 'package:gallopgate/features/chat/chat_screen.dart';
import 'package:gallopgate/features/home/home_screen.dart';
import 'package:gallopgate/features/main_shell/main_shell_screen.dart';
import 'package:gallopgate/features/onboard/on_board_screen.dart';
import 'package:gallopgate/features/schedule/schedule_screen.dart';
import 'package:gallopgate/utils/constraints/routes.dart';
import 'package:gallopgate/utils/enums/auth_state.dart';
import 'package:go_router/go_router.dart';

class GRouter {
  GRouter({required this.authCubit});

  final AuthCubit authCubit;

  static final GlobalKey<NavigatorState> _rootKey = GlobalKey();
  static final GlobalKey<NavigatorState> _mainShellKey = GlobalKey();

  late GoRouter router = GoRouter(
    navigatorKey: _rootKey,
    debugLogDiagnostics: true,
    initialLocation: GRoutes.initialLocation,
    redirect: _GRouterRedirect.auth,
    routes: [
      // --- Unauthenticated --- //

      GoRoute(
        path: GRoutes.onboard,
        pageBuilder: (context, state) => OnBoardScreen.page,
      ),
      GoRoute(
        path: GRoutes.auth,
        pageBuilder: (context, state) => LoginScreen.page,
        routes: <GoRoute>[
          GoRoute(
            path: GRoutes.signupRaw,
            pageBuilder: (context, state) => SignupScreen.page,
          ),
        ],
      ),

      // ---Authenticated --- //

      ShellRoute(
        parentNavigatorKey: _rootKey,
        navigatorKey: _mainShellKey,
        pageBuilder: (context, state, page) {
          return MainShellScreen.page(page, 0);
        },
        routes: [
          GoRoute(
            path: GRoutes.home,
            parentNavigatorKey: _mainShellKey,
            pageBuilder: (context, state) => HomeScreen.page,
          ),
          GoRoute(
            path: GRoutes.schedule,
            parentNavigatorKey: _mainShellKey,
            pageBuilder: (context, state) => ScheduleScreen.page,
          ),
          GoRoute(
            path: GRoutes.chat,
            parentNavigatorKey: _mainShellKey,
            pageBuilder: (context, state) => ChatScreen.page,
          ),
          GoRoute(
            path: GRoutes.account,
            parentNavigatorKey: _mainShellKey,
            pageBuilder: (context, state) => AccountScreen.page,
          ),
        ],
      )
    ],
  );
}

/// Helper class for [GRouter]
class _GRouterRedirect {
  const _GRouterRedirect._();

  static FutureOr<String?> auth(
    BuildContext context,
    GoRouterState state,
  ) async {
    AuthCubit cubit = context.read();
    log(cubit.state.state.name);
    if (GRoutes.authRoutes.contains(state.matchedLocation)) {
      // --- Auth Routes --- //
      if (cubit.state.state == AuthenticationState.authenticated) {
        return GRoutes.home;
      }

      // --- Not Authenticated User
      return null;
    } else {
      // --- Not auth Routes ONLY Authenticated Users --- //
      if (cubit.state.state == AuthenticationState.noAuthenticated) {
        return GRoutes.auth;
      }

      // --- Authenticated User --- //
      return null;
    }
  }
}
