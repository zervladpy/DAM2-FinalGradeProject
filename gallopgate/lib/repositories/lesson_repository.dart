import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/models/lesson/lesson_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LessonRepository {
  LessonRepository({
    required SupabaseClient client,
  })  : _client = client,
        _query = client.from(Lesson.table);

  final SupabaseClient _client; // ignore: unused_field
  final SupabaseQueryBuilder _query;

  final String selectQuery =
      """id, title, capacity, start_h, weekday, duration, 
      instructor:profiles!lessons_instructor_fkey (id, first_name, last_name, email, avatar_url),
      creator:profiles!lessons_creator_fkey (id, first_name, last_name, email, avatar_url),
      lesson_members (id, profile:profiles (*), horse:horses (*), lesson),
      category:lesson_categories (*)""";

  Future<LessonDto> create(Lesson model) async {
    return await _query
        .insert(model.toJson())
        .select('id, title, lesson_categories ( title )')
        .single()
        .withConverter((row) {
      return LessonDto.fromJson(row);
    });
  }

  Future<void> delete(String id) async {
    await _query.delete().match({'id': id});
  }

  Future<Lesson?> read(String id) {
    return _query
        .select(selectQuery)
        .eq('id', id)
        .maybeSingle()
        .withConverter((row) {
      if (row == null) return null;

      final Lesson lesson = Lesson.fromJson(row);

      return lesson;
    });
  }

  Future<List<Lesson>> readAll(String organizationId) async {
    return await _query
        .select(selectQuery)
        .eq('organization', organizationId)
        .withConverter((rows) => rows.map(Lesson.fromJson).toList());
  }

  Future<List<LessonDto>> readAllDto(String organizationId) async {
    return await _query
        .select('id, title, lesson_categories (title)')
        .eq('organization', organizationId)
        .withConverter((rows) => rows.map(LessonDto.fromJson).toList());
  }

  Future<LessonDto?> update(Lesson model) {
    return _query
        .update(model.toJson())
        .eq('id', model.id)
        .select(selectQuery)
        .single()
        .withConverter(LessonDto.fromJson);
  }

  Future<List<Lesson>> fetchByInstructor(String id) async {
    return await _query
        .select(selectQuery)
        .eq('instructor', id)
        .withConverter((rows) => rows.map(Lesson.fromJson).toList());
  }

  Future<List<Lesson>> fetchByProfile(String id) async {
    return await _query
        .select(selectQuery)
        .eq('lesson_members.profile.id', id)
        .withConverter((rows) => rows.map(Lesson.fromJson).toList());
  }
}
