import 'package:gallopgate/models/organization/organization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrganizationRepository {
  OrganizationRepository(SupabaseClient client)
      : query = client.from(Organization.table);

  final SupabaseQueryBuilder query;

  Future<Organization?> fetch(String id) async {
    var response =
        await query.select().eq('id', id).maybeSingle().withConverter((record) {
      if (record == null) return null;
      return Organization.fromJson(record);
    });

    return response;
  }

  Future<Organization> create(String name, String description) async {
    return query
        .insert({"name": name, "description": description})
        .select()
        .single()
        .withConverter((record) => Organization.fromJson(record));
  }

  Future<void> update(String? name, String? description) async {
    Map<String, Object> newValues = {};

    if (name != null) newValues.addAll({'name': name});
    if (description != null) newValues.addAll({'description': description});

    query.update(newValues);
  }
}
