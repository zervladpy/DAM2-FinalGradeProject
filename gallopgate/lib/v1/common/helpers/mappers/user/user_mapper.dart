import 'package:gallopgate/v1/common/data/entities/user/user_entity.dart';
import 'package:gallopgate/v1/common/domain/models/user.dart';
import 'package:gallopgate/v1/common/helpers/mappers/mapper.dart';

class UserMapper extends Mapper<User, UserEntity> {
  @override
  UserEntity toEntity(User model) {
    return UserEntity(
      id: model.id,
      email: model.email,
      name: model.name,
      photoUrl: model.photoUrl,
      roles: model.roles,
      organizationId: model.organizationId,
    );
  }

  @override
  User toModel(UserEntity entity) {
    return User(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      photoUrl: entity.photoUrl,
      roles: entity.roles,
      organizationId: entity.organizationId,
    );
  }
}
