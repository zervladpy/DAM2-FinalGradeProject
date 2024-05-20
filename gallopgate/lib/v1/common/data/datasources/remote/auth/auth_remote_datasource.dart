import 'package:gallopgate/v1/common/data/datasources/remote/remote_datasource.dart';
import 'package:gallopgate/v1/common/data/entities/auth/auth_user_entity.dart';

abstract class AuthRemoteDatasource<T> extends RemoteDatasource<T> {
  const AuthRemoteDatasource(super.source);

  AuthUserEntity? get currentUser;

  Future<AuthUserEntity?> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<AuthUserEntity?> registerWithEmailAndPassword(
    String email,
    String password,
  );

  Future<void> logout();
}
