import 'package:gallopgate/core/domain/datasource/auth/i_auth_remote_datasource.dart';
import 'package:gallopgate/core/domain/models/model_user.dart';
import 'package:gallopgate/core/domain/repository/auth/i_auth_repository.dart';

class AuthenticationRepository extends IAuthRepository {
  
  AuthenticationRepository(this.remote);

  final IAuthRemoteDatasource remote;

  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) {
    return remote.loginWithEmailAndPassword(email, password);
  }

  @override
  Future<void> logout() {
    return remote.logout();
  }

  @override
  Future<User?> signupWithEmailAndPassword(String email, String password) {
    return remote.signupWithEmailAndPassword(email, password);
  }
}