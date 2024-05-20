import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallopgate/v2/ui/screens/auth_login/auth_login_page.dart';
import 'package:gallopgate/v2/ui/screens/auth_onboard/auth_onboard_page.dart';
import 'package:gallopgate/v2/ui/screens/auth_otp/auth_otp_page.dart';
import 'package:gallopgate/v2/ui/screens/auth_register/auth_register_page.dart';
import 'package:gallopgate/v2/ui/screens/auth_reset_password_page/auth_reset_password_page.dart';
import 'package:gallopgate/v2/ui/screens/event_create/event_create_page.dart';
import 'package:gallopgate/v2/ui/screens/event_details/event_details_page.dart';
import 'package:gallopgate/v2/ui/screens/horse_create/horse_create_page.dart';
import 'package:gallopgate/v2/ui/screens/horse_details/horse_details_page.dart';
import 'package:gallopgate/v2/ui/screens/lesson_create/lesson_create_page.dart';
import 'package:gallopgate/v2/ui/screens/lesson_details/lesson_details_page.dart';
import 'package:gallopgate/v2/ui/screens/main_calendar/main_calendar_page.dart';
import 'package:gallopgate/v2/ui/screens/main_home/main_home_page.dart';
import 'package:gallopgate/v2/ui/screens/main_manage/main_manage_page.dart';
import 'package:gallopgate/v2/ui/screens/main_schedule/main_schedule_page.dart';
import 'package:gallopgate/v2/ui/screens/main_settings/main_settings_page.dart';
import 'package:gallopgate/v2/ui/screens/org_create/org_create_page.dart';
import 'package:gallopgate/v2/ui/screens/org_details/org_details_page.dart';
import 'package:gallopgate/v2/ui/screens/org_explore/org_explore_page.dart';
import 'package:gallopgate/v2/ui/screens/user_create/user_create_page.dart';
import 'package:gallopgate/v2/ui/screens/user_details/user_details_page.dart';
import 'package:gallopgate/v2/ui/wrappers/auth_wrapper/auth_wrapper.dart';
import 'package:gallopgate/v2/ui/wrappers/main_wrapper/main_wrapper.dart';
import 'package:go_router/go_router.dart';

class ApplicationRouter {
  ApplicationRouter._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> _authNavigationKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> _mainNavigationKey =
      GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/auth',
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => '/auth',
      ),
      ShellRoute(
        navigatorKey: _authNavigationKey,
        builder: (context, state, child) {
          return AuthWrapper(state: state, child: child);
        },
        routes: [
          GoRoute(
            path: '/auth',
            pageBuilder: (context, state) => AuthOnboardPage.page,
            routes: [
              GoRoute(
                path: 'login',
                pageBuilder: (context, state) => AuthLoginPage.page,
              ),
              GoRoute(
                path: 'register',
                pageBuilder: (context, state) => AuthRegisterPage.page,
              ),
              GoRoute(
                path: 'otp',
                pageBuilder: (context, state) => AuthOtpPage.page,
              ),
              GoRoute(
                path: 'rest-password',
                pageBuilder: (context, state) => AuthResetPasswordPage.page,
              ),
            ],
          )
        ],
      ),
      ShellRoute(
        navigatorKey: _mainNavigationKey,
        builder: (context, state, child) {
          return MainWrapper(state: state, child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => MainHomePage.page,
          ),
          GoRoute(
            path: '/calendar',
            pageBuilder: (context, state) => MainCalendarPage.page,
          ),
          GoRoute(
            path: '/schedule',
            pageBuilder: (context, state) => MainSchedulePage.page,
          ),
          GoRoute(
            path: '/management',
            pageBuilder: (context, state) => MainManagePage.page,
          ),
          GoRoute(
            path: '/account',
            pageBuilder: (context, state) => MainSettingsPage.page,
          ),
        ],
      ),

      /// Event
      GoRoute(
        path: '/event',
        pageBuilder: (context, state) => EventDetailsPage.page,
      ),
      GoRoute(
        path: '/create-event',
        pageBuilder: (context, state) => EventCreatePage.page,
      ),

      /// Org
      GoRoute(
        path: '/organizations',
        pageBuilder: (context, state) => OrgExplorePage.page,
        routes: [
          GoRoute(
            path: 'create',
            pageBuilder: (context, state) => OrgCreatePage.page,
          ),
          GoRoute(
              path: ':id',
              pageBuilder: (context, state) => OrgDetailsPage.page),
        ],
      ),

      /// User
      GoRoute(
        path: '/users/create',
        pageBuilder: (context, state) => UserCreatePage.page,
      ),
      GoRoute(
        path: '/users/:id',
        pageBuilder: (context, state) => UserDetailsPage.page,
      ),

      /// Lessons
      GoRoute(
        path: '/lessons',
        pageBuilder: (context, state) => LessonDetailsPage.page,
      ),
      GoRoute(
        path: '/lessons/:id',
        pageBuilder: (context, state) => LessonDetailsPage.page,
      ),
      GoRoute(
        path: '/lessons/create',
        pageBuilder: (context, state) => LessonCreatePage.page,
      ),

      /// Horses
      GoRoute(
        path: '/horses',
        pageBuilder: (context, state) => LessonDetailsPage.page,
      ),
      GoRoute(
        path: '/horses/:id',
        pageBuilder: (context, state) => HorseDetailsPage.page,
      ),
      GoRoute(
        path: '/horses/create',
        pageBuilder: (context, state) => HorseCreatePage.page,
      ),
    ],
  );
}
