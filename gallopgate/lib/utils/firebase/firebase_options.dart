// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAL6ztc_b88kK33Tke8I_7VFdfMbiQKL9s',
    appId: '1:160798568463:web:1770ebf5e4b07e9759f37a',
    messagingSenderId: '160798568463',
    projectId: 'gallopgate',
    authDomain: 'gallopgate.firebaseapp.com',
    databaseURL: 'https://gallopgate-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'gallopgate.appspot.com',
    measurementId: 'G-1FTRHLJQH0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLFP7ttV5oyjH5Ji1LemIs2w0Ptg8tx8M',
    appId: '1:160798568463:android:0c58344310e70abd59f37a',
    messagingSenderId: '160798568463',
    projectId: 'gallopgate',
    databaseURL: 'https://gallopgate-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'gallopgate.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTmt7qfFpeRlZwTtaS_HLVoPD5dLlC1Hs',
    appId: '1:160798568463:ios:0055d30d01a4cdec59f37a',
    messagingSenderId: '160798568463',
    projectId: 'gallopgate',
    databaseURL: 'https://gallopgate-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'gallopgate.appspot.com',
    iosBundleId: 'com.zervladpy.gallopgate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCTmt7qfFpeRlZwTtaS_HLVoPD5dLlC1Hs',
    appId: '1:160798568463:ios:7dfbc6f782d5c34d59f37a',
    messagingSenderId: '160798568463',
    projectId: 'gallopgate',
    databaseURL: 'https://gallopgate-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'gallopgate.appspot.com',
    iosBundleId: 'com.zervladpy.gallopgate.RunnerTests',
  );
}