import 'package:gallopgate/v1/common/domain/models/auth_user.dart';

abstract class AuthRepository {
  const AuthRepository();

  AuthUser? get currentUser;
  Future<AuthUser?> signInWithEmailAndPassword(String email, String password);
  Future<AuthUser?> registerWithEmailAndPassword(String email, String password);
  Future<void> logout();
}
