import 'dart:developer';

import 'package:gallopgate/common/interfaces/crud_repository.dart';
import 'package:gallopgate/models/lesson_member/lesson_member.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LessonMembersRepository extends CrudRepository<LessonMember, String> {
  LessonMembersRepository({required SupabaseClient client})
      : _client = client,
        _query = client.from(LessonMember.table);

  final SupabaseClient _client; // ignore: unused_field
  final SupabaseQueryBuilder _query;

  final String selectQuery =
      'id, lesson, profile:profiles (*), horse:horses (*)';

  @override
  Future<LessonMember> create(LessonMember model) async {
    return await _query
        .insert(model.toJson())
        .select(selectQuery)
        .single()
        .withConverter(LessonMember.fromJson);
  }

  Future<List<LessonMember>> createMany(List<LessonMember> models) async {
    return await _query
        .insert(models.map((e) => e.toJson()).toList())
        .select()
        .withConverter((rows) => rows.map(LessonMember.fromJson).toList());
  }

  @override
  Future<void> delete(String id) async {
    await _query.delete().eq('id', id);
  }

  @override
  Future<LessonMember?> read(String id) {
    return _query
        .select(selectQuery)
        .eq('id', id)
        .single()
        .withConverter(LessonMember.fromJson);
  }

  Future<List<LessonMember>> readAll(String lessonId) async {
    return await _query
        .select(selectQuery)
        .eq('lesson', lessonId)
        .withConverter((rows) => rows.map(LessonMember.fromJson).toList());
  }

  @override
  Future<LessonMember?> update(LessonMember model) {
    return _query
        .update(model.toJson())
        .eq('id', model.id!)
        .select(selectQuery)
        .single()
        .withConverter((row) {
      log('row: $row');
      return LessonMember.fromJson(row);
    });
  }
}
