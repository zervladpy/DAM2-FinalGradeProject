import 'router.library.dart';

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
              GoRoute(
                path: 'terms',
                pageBuilder: (context, state) => AuthTermsPage.page,
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
                path: 'lesson-categories',
                pageBuilder: (context, state) => ManageLessonCategoryPage.page,
                routes: <GoRoute>[
                  GoRoute(
                    path: 'create',
                    pageBuilder: (context, state) =>
                        LessonCategoryCreatePage.page,
                  ),
                  GoRoute(
                    path: ':id',
                    pageBuilder: (context, state) {
                      String? id = state.pathParameters['id'];
                      if (id == null) {
                        return ErrorNotFoundPage.page;
                      } else {
                        return LessonCategoryDetailsPage.page(id);
                      }
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'lessons',
                pageBuilder: (context, state) => ManageLessonsPage.page,
                routes: [
                  GoRoute(
                    path: 'create',
                    pageBuilder: (context, state) => LessonCreatePage.page,
                  ),
                  GoRoute(
                    path: ':id',
                    pageBuilder: (context, state) {
                      String? id = state.pathParameters['id'];
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
