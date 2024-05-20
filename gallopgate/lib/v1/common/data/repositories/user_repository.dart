import 'dart:developer';

import 'package:gallopgate/v1/common/data/entities/user/user_entity.dart';
import 'package:gallopgate/v1/common/domain/models/user.dart';
import 'package:gallopgate/v1/common/domain/repositories/user/user_repository.dart';
import 'package:gallopgate/v1/common/helpers/mappers/mapper.dart';
import 'package:gallopgate/v1/common/helpers/mappers/user/user_mapper.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl(super.remote);

  final Mapper<User, UserEntity> mapper = UserMapper();

  @override
  Future<User?> createUser(User user) async {
    var entity = await remote.create(mapper.toEntity(user));

    if (entity == null) return null;

    return mapper.toModel(entity);
  }

  @override
  Future<User?> fetchUser(String id) async {
    var entity = await remote.fetchOne(id);

    log('User fetched: $entity');

    if (entity == null) return null;

    return mapper.toModel(entity);
  }

  @override
  Future<List<User>> fetchUsers(List<String> ids) async {
    return remote
        .fetchMany(ids)
        .then((value) => value.map(mapper.toModel).toList());
  }

  @override
  Future<User?> updateUser(User user) async {
    var entity = await remote.update(mapper.toEntity(user));

    if (entity == null) return null;

    return mapper.toModel(entity);
  }
}
