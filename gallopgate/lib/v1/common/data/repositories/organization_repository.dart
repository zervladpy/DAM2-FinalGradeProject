import 'package:gallopgate/v1/common/data/datasources/remote/organization/organization_remote_datasource.dart';
import 'package:gallopgate/v1/common/data/entities/organization/organization_entity.dart';
import 'package:gallopgate/v1/common/domain/models/organization.dart';
import 'package:gallopgate/v1/common/domain/repositories/organization/organization_repository.dart';
import 'package:gallopgate/v1/common/helpers/mappers/mapper.dart';
import 'package:gallopgate/v1/common/helpers/mappers/organization/organization_mapper.dart';

class OrganizationRepositoryImpl implements OrganizationRepository {
  OrganizationRepositoryImpl(
    OrganizationRemoteDatasource remote,
  ) : _remote = remote;

  final OrganizationRemoteDatasource _remote;
  final Mapper<Organization, OrganizationEntity> _mapper = OrganizationMapper();

  @override
  Future<Organization?> create(Organization organization) async {
    OrganizationEntity? entity = await _remote.create(
      _mapper.toEntity(organization),
    );

    return entity != null ? _mapper.toModel(entity) : null;
  }

  @override
  Future<Organization?> fetch(String id) async {
    OrganizationEntity? entity = await _remote.fetch(id);

    return entity != null ? _mapper.toModel(entity) : null;
  }

  @override
  Future<void> update(Organization organization) {
    return _remote.update(_mapper.toEntity(organization));
  }

  @override
  Future<List<Organization>> fetchAll() {
    return _remote.fetchAll().then(
          (entities) => entities.map(_mapper.toModel).toList(),
        );
  }
}
