import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gallopgate/v1/config/firebase/firebase_options.dart';
import 'package:gallopgate/v1/config/initializers/initializer.dart';
import 'package:gallopgate/v1/config/locator/locator.dart';
import 'package:get_it/get_it.dart';

class FirebaseInitializer extends Initializer {
  FirebaseInitializer(GetIt? locator) : _locator = locator ?? gLocator;

  final GetIt _locator;

  @override
  FutureOr<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _locator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
    _locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  }
}
