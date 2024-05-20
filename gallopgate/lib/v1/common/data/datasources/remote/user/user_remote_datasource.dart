import 'package:gallopgate/v1/common/data/datasources/remote/remote_datasource.dart';
import 'package:gallopgate/v1/common/data/entities/user/user_entity.dart';

abstract class UserRemoteDatasource<T> extends RemoteDatasource<T> {
  const UserRemoteDatasource(super.source);

  Future<UserEntity?> fetchOne(String id);

  Future<List<UserEntity>> fetchMany(List<String> ids);

  Future<UserEntity?> create(UserEntity data);

  Future<UserEntity?> update(UserEntity data);
}
