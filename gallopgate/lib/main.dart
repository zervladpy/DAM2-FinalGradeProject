import 'package:flutter/material.dart';
import 'package:gallopgate/v1/config/locator/locator.dart';
import 'package:gallopgate/v2/repositories/auth_repository.dart';
import 'package:gallopgate/v2/repositories/lecture_repository.dart';
import 'package:gallopgate/v2/repositories/organization_repository.dart';
import 'package:gallopgate/v2/repositories/profile_repository.dart';
import 'package:gallopgate/v2/ui/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'v2/config/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*
  await FirebaseInitializer(null).init();

  AuthRepository authRepository = AuthRepositoryImpl(
    FirebaseAuthRemoteDatasource(gLocator.get()),
  );

  gLocator.registerLazySingleton(() => authRepository);

  UserRepository userRepository = UserRepositoryImpl(
    FirebaseUserRemoteDatasource(gLocator.get()),
  );

  gLocator.registerLazySingleton(() => userRepository);

  OrganizationRepository organizationRepository = OrganizationRepositoryImpl(
    OrganizationFirebaseRemoteDatasource(gLocator.get()),
  );

  gLocator.registerLazySingleton(() => organizationRepository);

  runApp(const ApplicationV1());
  */

  await Supabase.initialize(
    url: 'https://nmawcdwvqnmokamzjgjj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5tYXdjZHd2cW5tb2thbXpqZ2pqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTYxODczMTAsImV4cCI6MjAzMTc2MzMxMH0.qONVqPkRjZMkqcKSuVy-5ZhKn5_jSBm4r_6qGF47MrA',
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.info,
    ),
    storageOptions: const StorageClientOptions(
      retryAttempts: 10,
    ),
  );

  gLocator.registerSingleton(Supabase.instance.client);

  gLocator.registerSingleton(ProfileRepository(
    client: gLocator.get(),
  ));

  var authRepo = await AuthRepository(
    client: gLocator.get(),
    profileRepository: gLocator.get(),
  ).init();

  gLocator.registerSingleton(authRepo);

  gLocator.registerSingleton(OrganizationRepository(
    gLocator.get(),
  ));

  gLocator.registerSingleton(LectureRepository(
    gLocator.get(),
  ));

  runApp(const ApplicationV2());
}

/*
class ApplicationV1 extends StatelessWidget {
  const ApplicationV1({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            CurrentUserUseCase(gLocator.get()),
            LoginUseCase(gLocator.get()),
            RegisterUseCase(
              gLocator.get(),
              gLocator.get(),
            ),
            LogoutUseCase(gLocator.get()),
          )..add(AuthInitial()),
        ),
        BlocProvider(
          create: (context) => CacheBloc(
            FetchUserUseCase(
              gLocator.get(),
            ),
            FetchOrganizationUseCase(
              gLocator.get(),
            ),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: const AppTheme().light,
        darkTheme: const AppTheme().dark,
        home: const AuthWrapper(),
      ),
    );
  }
}
*/

class ApplicationV2 extends StatelessWidget {
  const ApplicationV2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: const AppTheme().light,
      darkTheme: const AppTheme().dark,
      routerConfig: ApplicationRouter.router,
    );
  }
}
