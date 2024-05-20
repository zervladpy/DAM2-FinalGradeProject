import 'package:gallopgate/v1/common/data/entities/auth/auth_user_entity.dart';
import 'package:gallopgate/v1/common/domain/models/auth_user.dart';
import 'package:gallopgate/v1/common/helpers/mappers/mapper.dart';

class AuthUserMapper extends Mapper<AuthUser, AuthUserEntity> {
  @override
  AuthUserEntity toEntity(AuthUser model) {
    return AuthUserEntity(model.id, model.email);
  }

  @override
  AuthUser toModel(AuthUserEntity entity) {
    return AuthUser(entity.id, entity.email);
  }
}
