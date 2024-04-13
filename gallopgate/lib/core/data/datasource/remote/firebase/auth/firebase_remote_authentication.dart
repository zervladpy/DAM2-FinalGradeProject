import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:gallopgate/core/domain/datasource/auth/i_auth_remote_datasource.dart';
import 'package:gallopgate/core/domain/models/model_user.dart';
import 'package:gallopgate/utils/error/auth/auth_exeption.dart';

class FirebaseRemoteAuthentication extends IAuthRemoteDatasource {
  FirebaseRemoteAuthentication(this.firebaseAuth) {
    _user = fromFirebaseUser(firebaseAuth.currentUser);
    log('AuthDatasource:  ${_user?.email ?? 'no email'}');
  }

  final firebase_auth.FirebaseAuth firebaseAuth;

  User? _user;

  @override
  User? get currentUser => _user;

  /// Login with email and password
  ///
  /// Throws:
  /// [AuthLoginException]
  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      var credentials = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return fromFirebaseUser(credentials.user);
    } on firebase_auth.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw AuthLoginException.invalidEmail();
        case 'wrong-password':
          throw AuthLoginException.invalidPassword();
        case 'user-disabled':
          throw AuthLoginException.userDisabled();
        case 'user-not-found':
          throw AuthLoginException.userNotFound();
        default:
          throw AuthLoginException.unkonwn();
      }
    }
  }

  @override
  Future<void> logout() {
    _user = null;
    return firebaseAuth.signOut();
  }

  /// Signup with email and password
  ///
  /// Throws:
  /// [AuthSignupException]
  @override
  Future<User?> signupWithEmailAndPassword(
      String email, String password) async {
    try {
      var credentaials = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return fromFirebaseUser(credentaials.user);
    } on firebase_auth.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw AuthSignupException.invalidEmail();
        case 'email-already-in-use':
          throw AuthSignupException.emailInUse();
        case 'operation-not-allowed':
          throw AuthSignupException.operationNotAllowed();
        case 'weak-password':
          throw AuthSignupException.weekPassword();
        default:
          throw AuthLoginException.unkonwn();
      }
    }
  }

  User? fromFirebaseUser(firebase_auth.User? user) {
    if (user != null) {
      _user = User(uid: user.uid, email: user.email!);
    } else {
      _user = null;
    }

    return _user;
  }

  @override
  Stream<bool> get userAuthenticationStream {
    return firebaseAuth.authStateChanges().map((event) => event != null);
  }
}
