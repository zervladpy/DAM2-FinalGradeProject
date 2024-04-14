import 'package:gallopgate/core/domain/models/model_user.dart';

/// Contract for in app authorization
abstract class IAuthRepository {
  User? get currentUser;

  bool get isAuthenticated;

  Future<User?> loginWithEmailAndPassword(String email, String password);

  Future<User?> signupWithEmailAndPassword(String email, String password);

  Future<void> logout();
}
