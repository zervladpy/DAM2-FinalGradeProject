import 'package:gallopgate/v1/common/data/datasources/remote/remote_datasource.dart';
import 'package:gallopgate/v1/common/data/entities/organization/organization_entity.dart';

abstract class OrganizationRemoteDatasource<T> extends RemoteDatasource<T> {
  const OrganizationRemoteDatasource(super.source);

  Future<List<OrganizationEntity>> fetchAll();
  Future<OrganizationEntity?> fetch(String id);
  Future<OrganizationEntity?> create(OrganizationEntity entity);
  Future<void> update(OrganizationEntity entity);
}
