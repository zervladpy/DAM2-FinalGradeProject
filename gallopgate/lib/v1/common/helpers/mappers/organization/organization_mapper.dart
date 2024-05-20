import 'package:gallopgate/v1/common/data/entities/organization/organization_entity.dart';
import 'package:gallopgate/v1/common/domain/models/organization.dart';
import 'package:gallopgate/v1/common/helpers/mappers/mapper.dart';

class OrganizationMapper extends Mapper<Organization, OrganizationEntity> {
  @override
  OrganizationEntity toEntity(Organization model) {
    return OrganizationEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      logoUrl: model.logoUrl,
      country: model.country,
      city: model.city,
      street: model.street,
      creator: model.creator,
      users: model.users,
    );
  }

  @override
  Organization toModel(OrganizationEntity entity) {
    return Organization(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      logoUrl: entity.logoUrl,
      country: entity.country,
      city: entity.city,
      street: entity.street,
      creator: entity.creator,
      users: entity.users,
    );
  }
}
