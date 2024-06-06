import 'package:gallopgate/common/interfaces/crud_repository.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HorseRepository extends CrudRepository<Horse, String> {
  HorseRepository(this.client) {
    query = client.from(Horse.table);
  }

  final SupabaseClient client;
  late SupabaseQueryBuilder query;

  Stream<List<Horse>> streamAll(String organizaitonId) {
    return query
        .select()
        .eq('organization_id', organizaitonId)
        .withConverter(_fromRemoteList)
        .asStream();
  }

  @override
  Future<Horse> create(Horse model) async {
    return query
        .insert(_toRemote(model))
        .select()
        .single()
        .withConverter(_fromRemote);
  }

  @override
  Future<void> delete(String id) async {
    query.delete().eq('id', id);
  }

  @override
  Future<Horse?> read(String id) async {
    return query
        .select()
        .eq('id', id)
        .maybeSingle()
        .withConverter((v) => v == null ? null : _fromRemote(v));
  }

  Future<List<Horse>> readAllByOrganization(String organizaitonId) async {
    return query
        .select()
        .eq('organization_id', organizaitonId)
        .withConverter(_fromRemoteList);
  }

  /// Retrieve all horses by owner
  /// if ownerId is null, it will return all oraganization horses
  Future<List<Horse>> readAllByOwner(String? ownerId) async {
    return query
        .select()
        .eq('owner_id', ownerId ?? "null")
        .withConverter(_fromRemoteList);
  }

  @override
  Future<void> update(Horse model) {
    if (model.id == null) {
      throw Exception('id-no-present');
    }
    return query.update(_toRemote(model)).eq('id', model.id!);
  }

  Horse _fromRemote(Map<String, dynamic> json) {
    return Horse.fromJson(json);
  }

  List<Horse> _fromRemoteList(List<Map<String, dynamic>> json) {
    return json.map(_fromRemote).toList();
  }

  Map<String, dynamic> _toRemote(Horse model) {
    return model.toJson();
  }
}
