import 'package:gallopgate/v1/common/domain/models/organization.dart';

abstract class OrganizationRepository {
  Future<List<Organization>> fetchAll();
  Future<Organization?> fetch(String id);
  Future<Organization?> create(Organization organization);
  Future<void> update(Organization organization);
}
