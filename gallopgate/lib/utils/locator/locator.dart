import 'package:gallopgate/core/data/datasource/remote/firebase/auth/firebase_remote_authentication.dart';
import 'package:gallopgate/core/data/repository/auth/firebase_repository_authentication.dart';
import 'package:gallopgate/core/domain/datasource/auth/i_auth_remote_datasource.dart';
import 'package:gallopgate/core/domain/repository/auth/i_auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GLocator {
  static GetIt? _locator;

  static GetIt get locator {
    assert(_locator != null, 'Locator has not been initialized');
    return _locator!;
  }

  void init() {
    _locator = GetIt.instance;

    _registerFirebase();
    _registerFirebaseDatasources();
    _registerFirebaseReposiotries();
  }

  /// Register Firebase Services
  void _registerFirebase() {
    // --- Firebase Auth --- //
    locator.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );

    // --- Firebase Firestore --- //
    locator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
  }

  /// Register [Firebase] Datasources
  void _registerFirebaseDatasources() {
    // --- Auth Datasource --- //
    locator.registerSingleton<IAuthRemoteDatasource>(FirebaseRemoteAuthentication(locator.get()));
  }

  /// Register Repositories
  void _registerFirebaseReposiotries() {
    // --- AuthRepository --- //
    locator.registerSingleton<IAuthRepository>(FirebaseAuthenticationRepository(
        locator.get<IAuthRemoteDatasource>()));
  }

  // --- Dispose --- //
  void dispose() {
    _locator = null;
  }
}
