import 'package:firebase_auth/firebase_auth.dart';
import 'package:gallopgate/v1/common/data/datasources/remote/auth/auth_remote_datasource.dart';
import 'package:gallopgate/v1/common/data/entities/auth/auth_user_entity.dart';
import 'package:gallopgate/v1/resources/exception/auth/auth_exception.dart';

/// [FirebaseAuth] auth remote datasource implementation
class FirebaseAuthRemoteDatasource extends AuthRemoteDatasource<FirebaseAuth> {
  const FirebaseAuthRemoteDatasource(super.source);

  @override
  AuthUserEntity? get currentUser => map(source.currentUser);

  @override
  Future<AuthUserEntity?> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    AuthUserEntity? user;

    try {
      user = await source
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => map(value.user));
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "wrong-password":
          throw InvalidCredentialsException(error.code);
        case "invalid-email":
          throw InvalidEmailException(error.code);
        case "user-disabled":
          throw AccountLockedException(error.code);
        case "user-not-found":
        default:
          throw InvalidCredentialsException(error.code);
      }
    }

    return user;
  }

  @override
  Future<AuthUserEntity?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    AuthUserEntity? user;

    try {
      user = await source
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) => map(value.user));
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "email-already-in-use":
          throw InvalidCredentialsException(error.code);
        case "invalid-email":
          throw InvalidEmailException(error.code);
        case "operation-not-allowed":
          throw InvalidCredentialsException(error.code);
        case "weak-password":
        default:
          throw CanNotCreateAccountAtThisMoment(error.code);
      }
    }

    return user;
  }

  @override
  Future<void> logout() {
    return source.signOut();
  }

  AuthUserEntity? map(User? user) {
    if (user == null) return null;

    return AuthUserEntity(user.uid, user.email!);
  }
}
