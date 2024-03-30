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

  // --- Dispose --- //
  void dispose() {
    _locator = null;
  }
}
