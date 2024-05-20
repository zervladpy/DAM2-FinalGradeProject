import 'package:gallopgate/v1/common/data/datasources/remote/auth/auth_remote_datasource.dart';
import 'package:gallopgate/v1/common/data/entities/auth/auth_user_entity.dart';
import 'package:gallopgate/v1/common/domain/models/auth_user.dart';
import 'package:gallopgate/v1/common/domain/repositories/auth/auth_repository.dart';
import 'package:gallopgate/v1/common/helpers/mappers/mapper.dart';
import 'package:gallopgate/v1/common/helpers/mappers/user/auth_user_mapper.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.remote);

  final AuthRemoteDatasource remote;
  final Mapper<AuthUser, AuthUserEntity> mapper = AuthUserMapper();

  @override
  AuthUser? get currentUser {
    var user = remote.currentUser;

    if (user == null) return null;

    return mapper.toModel(user);
  }

  @override
  Future<AuthUser?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    var user = await remote.signInWithEmailAndPassword(email, password);

    if (user == null) return null;

    return mapper.toModel(user);
  }

  @override
  Future<AuthUser?> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    var user = await remote.registerWithEmailAndPassword(email, password);

    if (user == null) return null;

    return mapper.toModel(user);
  }

  @override
  Future<void> logout() async {
    await remote.logout();
  }
}
