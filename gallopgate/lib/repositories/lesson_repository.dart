import 'package:gallopgate/common/interfaces/crud_repository.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LessonRepository extends CrudRepository<Lesson, String> {
  LessonRepository({required SupabaseClient client})
      : _client = client,
        _query = client.from(Lesson.table);

  final SupabaseClient _client; // ignore: unused_field
  final SupabaseQueryBuilder _query;

  final String selectQuery =
      'id, lesson_members (id, profiles(*), horses (*), role (*)), capacity, start_h, weekday, duration';

  @override
  Future<Lesson> create(Lesson model) async {
    return await _query
        .insert(model.toJson())
        .select()
        .single()
        .withConverter(Lesson.fromJson);
  }

  @override
  Future<void> delete(String id) async {
    await _query.delete().match({'id': id});
  }

  @override
  Future<Lesson?> read(String id) {
    return _query
        .select(selectQuery)
        .eq('id', id)
        .maybeSingle()
        .withConverter((row) {
      if (row == null) return null;
      return Lesson.fromJson(row);
    });
  }

  Future<List<Lesson>> readAll(String organizationId) async {
    return await _query
        .select(selectQuery)
        .eq('organization_id', organizationId)
        .withConverter((rows) => rows.map(Lesson.fromJson).toList());
  }

  @override
  Future<Lesson?> update(Lesson model) {
    assert(model.id != null, 'Cannot update a model without an id');
    return _query
        .update(model.toJson())
        .eq('id', model.id!)
        .select(selectQuery)
        .single()
        .withConverter(Lesson.fromJson);
  }
}
