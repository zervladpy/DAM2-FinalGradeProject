import 'package:gallopgate/common/interfaces/crud_repository.dart';
import 'package:gallopgate/models/lesson_category/lesson_category.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LessonCategoryRepository extends CrudRepository<LessonCategory, String> {
  LessonCategoryRepository({
    required SupabaseClient client,
  })  : _client = client,
        _query = client.from(LessonCategory.table);

  final SupabaseClient _client; // ignore: unused_field
  final SupabaseQueryBuilder _query;

  @override
  Future<LessonCategory> create(LessonCategory model) async {
    return await _query
        .insert(model.toJson())
        .select()
        .single()
        .withConverter(LessonCategory.fromJson);
  }

  @override
  Future<void> delete(String id) async {
    await _query.delete().eq('id', id);
  }

  @override
  Future<LessonCategory?> read(String id) async {
    return await _query
        .select()
        .eq('id', id)
        .maybeSingle()
        .withConverter((row) {
      if (row == null) return null;
      return LessonCategory.fromJson(row);
    });
  }

  Future<List<LessonCategory>> readAll(String organizationId) {
    return _query
        .select()
        .eq('organization_id', organizationId)
        .withConverter((rows) => rows.map(LessonCategory.fromJson).toList());
  }

  @override
  Future<LessonCategory?> update(LessonCategory model) async {
    return await _query
        .update(model.toJson())
        .eq('id', model.id)
        .maybeSingle()
        .withConverter(
          (row) => row == null ? null : LessonCategory.fromJson(row),
        );
  }
}
