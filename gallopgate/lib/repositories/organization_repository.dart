import 'dart:developer';

import 'package:gallopgate/common/interfaces/crud_repository.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrganizationRepository extends CrudRepository<Organization, String> {
  OrganizationRepository({
    required SupabaseClient client,
  })  : _client = client,
        _query = client.from(Organization.table);

  final SupabaseClient _client; // ignore: unused_field
  final SupabaseQueryBuilder _query;

  @override
  Future<Organization> create(Organization model) async {
    log(model.toJson().toString());

    return await _query
        .insert(model.toJson())
        .select()
        .single()
        .withConverter(Organization.fromJson);
  }

  @override
  Future<void> delete(String id) async {
    await _query.delete().eq('id', id);
  }

  @override
  Future<Organization?> read(String id) async {
    return await _query
        .select()
        .eq('id', id)
        .single()
        .withConverter(Organization.fromJson);
  }

  Future<List<Organization>> readAll() async {
    return await _query
        .select()
        .withConverter((rows) => rows.map(Organization.fromJson).toList());
  }

  @override
  Future<Organization?> update(Organization model) async {
    assert(model.id != null, 'Id is Required');
    return await _query
        .update(model.toJson())
        .eq('id', model.id!)
        .select()
        .single()
        .withConverter(Organization.fromJson);
  }
}
