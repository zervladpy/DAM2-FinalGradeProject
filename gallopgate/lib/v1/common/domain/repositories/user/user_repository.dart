import 'package:gallopgate/v1/common/data/datasources/remote/user/user_remote_datasource.dart';
import 'package:gallopgate/v1/common/domain/models/user.dart';

abstract class UserRepository {
  const UserRepository(this.remote);

  final UserRemoteDatasource remote;

  Future<User?> fetchUser(String id);
  Future<List<User>> fetchUsers(List<String> ids);
  Future<User?> createUser(User user);
  Future<User?> updateUser(User user);
}
