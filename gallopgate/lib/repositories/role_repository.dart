import 'package:gallopgate/models/role/role.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RoleRepository {
  RoleRepository(SupabaseClient client) : query = client.from(Role.table);

  final SupabaseQueryBuilder query;

  Future<Role?> fetchRole(String id) {
    return query.select().eq('id', id).maybeSingle().withConverter((row) {
      if (row == null) return null;
      return Role.fromJson(row);
    });
  }

  Future<List<Role>> fetchRoles() {
    return query.select().withConverter((records) => records.map((row) {
          return Role.fromJson(row);
        }).toList());
  }
}
