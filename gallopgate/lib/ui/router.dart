import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gallopgate/ui/screens/auth_login/auth_login_page.dart';
import 'package:gallopgate/ui/screens/auth_onboard/auth_onboard_page.dart';
import 'package:gallopgate/ui/screens/auth_otp/auth_otp_page.dart';
import 'package:gallopgate/ui/screens/auth_register/auth_register_page.dart';
import 'package:gallopgate/ui/screens/auth_reset_password_page/auth_reset_password_page.dart';
import 'package:gallopgate/ui/screens/error_not_found/error_not_found_page.dart';
import 'package:gallopgate/ui/screens/horse_create/horse_create_page.dart';
import 'package:gallopgate/ui/screens/horse_details/horse_details_page.dart';
import 'package:gallopgate/ui/screens/category_create/lesson_create_page.dart';
import 'package:gallopgate/ui/screens/category_details/lesson_details_page.dart';
import 'package:gallopgate/ui/screens/main_calendar/main_calendar_page.dart';
import 'package:gallopgate/ui/screens/main_home/main_home_page.dart';
import 'package:gallopgate/ui/screens/main_manage/main_manage_page.dart';
import 'package:gallopgate/ui/screens/main_schedule/main_schedule_page.dart';
import 'package:gallopgate/ui/screens/main_settings/main_settings_page.dart';
import 'package:gallopgate/ui/screens/manage_horses/manage_horses_page.dart';
import 'package:gallopgate/ui/screens/manage_lessons/manage_lessons_page.dart';
import 'package:gallopgate/ui/screens/manage_organization/manage_organization_page.dart';
import 'package:gallopgate/ui/screens/manage_users/manage_users_page.dart';
import 'package:gallopgate/ui/screens/org_create/org_create_page.dart';
import 'package:gallopgate/ui/screens/org_details/org_details_page.dart';
import 'package:gallopgate/ui/screens/org_explore/org_explore_page.dart';
import 'package:gallopgate/ui/screens/schedule_create/schedule_create_page.dart';
import 'package:gallopgate/ui/screens/user_create/user_create_page.dart';
import 'package:gallopgate/ui/screens/user_details/user_details_page.dart';
import 'package:gallopgate/ui/wrappers/auth_wrapper/auth_wrapper.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_wrapper.dart';
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
            routes: [
              GoRoute(
                path: 'create',
                pageBuilder: (context, state) {
                  String? id =
                      (state.extra as Map<String, String>)['organization-id'];

                  if (id == null) {
                    return ErrorNotFoundPage.page;
                  }

                  return ScheduleCreatePage.page(id);
                },
              ),
              GoRoute(
                path: ':id',
                pageBuilder: (context, state) => const MaterialPage(
                  child: ErrorNotFoundPage(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/managment',
            pageBuilder: (context, state) => MainManagePage.page,
            routes: <GoRoute>[
              GoRoute(
                path: 'users',
                pageBuilder: (context, state) => ManageUsersPage.page,
                routes: <GoRoute>[
                  GoRoute(
                    path: 'create',
                    pageBuilder: (context, state) {
                      return UserCreatePage.page;
                    },
                  ),
                  GoRoute(
                    path: ':id',
                    pageBuilder: (context, state) {
                      String? id = state.pathParameters['id'];

                      if (id == null) return ErrorNotFoundPage.page;

                      return ProfileDetailsPage.page(id);
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'horses',
                pageBuilder: (context, state) => ManageHorsesPage.page,
                routes: <GoRoute>[
                  GoRoute(
                    path: 'create',
                    pageBuilder: (context, state) =>
                        HorseCreatePage.page, // HorseCreatePage.page,
                  ),
                  GoRoute(
                    path: ':id',
                    pageBuilder: (context, state) {
                      String? id = state.pathParameters['id'];

                      if (id == null) return ErrorNotFoundPage.page;

                      return HorseDetailsPage.page(id);
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'lessons',
                pageBuilder: (context, state) => ManageLessonsPage.page,
                routes: <GoRoute>[
                  GoRoute(
                    path: 'create',
                    pageBuilder: (context, state) => LessonCreatePage.page,
                  ),
                  GoRoute(
                    path: ':id',
                    pageBuilder: (context, state) {
                      String? id = state.pathParameters['id'];
                      log(id.toString());
                      if (id == null) {
                        return ErrorNotFoundPage.page;
                      } else {
                        return LessonDetailsPage.page(id);
                      }
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'organization',
                pageBuilder: (context, state) => ManageOrganizationPage.page,
              ),
            ],
          ),
          GoRoute(
            path: '/account',
            pageBuilder: (context, state) => MainSettingsPage.page,
            routes: [
              GoRoute(
                path: ':id',
                pageBuilder: (context, state) {
                  String? id = state.pathParameters['id'];
                  if (id == null) {
                    return ErrorNotFoundPage.page;
                  }
                  return ProfileDetailsPage.page(id);
                },
              ),
            ],
          ),
        ],
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
            pageBuilder: (context, state) {
              String? id = state.pathParameters['id'];
              if (id == null) {
                return ErrorNotFoundPage.page;
              } else {
                return OrgDetailsPage.page(id);
              }
            },
          ),
        ],
      ),
    ],
  );
}
