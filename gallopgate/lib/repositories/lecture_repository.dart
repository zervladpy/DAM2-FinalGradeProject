import 'dart:developer';

import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/models/lesson/lesson_preview_dto.dart';
import 'package:gallopgate/models/schedule/schedule.dart';
import 'package:gallopgate/repositories/schedule_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LectureRepository {
  LectureRepository({
    required SupabaseClient client,
    required this.scheduleRepository,
  }) : query = client.from(Lesson.table);

  final SupabaseQueryBuilder query;
  final ScheduleRepository scheduleRepository;

  Stream<List<LessonPreviewDto>> watch(String organizationId) {
    return query
        .select('id, title')
        .eq('organization_id', organizationId)
        .asStream()
        .map((event) {
      log(event.toString());
      return event.map(LessonPreviewDto.fromJson).toList();
    });
  }

  Future<Lesson?> fetch(String id) async {
    Lesson? lesson =
        await query.select().eq('id', id).maybeSingle().withConverter((record) {
      if (record == null) return null;
      return Lesson.fromJson(record);
    });

    if (lesson == null) return lesson;

    List<Schedule> schedules =
        await scheduleRepository.readFromLesson(lesson.id);

    lesson = lesson.copyWith(schedules: schedules);

    return lesson;
  }

  Future<List<Lesson>> fetchAll(String organizationId) async {
    return query
        .select()
        .eq('organization_id', organizationId)
        .withConverter((records) {
      return records.map(Lesson.fromJson).toList();
    });
  }

  Future<void> create(
      String title, String descriprion, String organizationId) async {
    return query.insert({
      'title': title,
      'description': descriprion,
      'organization_id': organizationId,
    });
  }

  Future<void> update(String? title, String? descriprion) async {
    Map<String, String> newValues = {};

    if (title != null) newValues.addAll({'title': title});
    if (descriprion != null) newValues.addAll({'description': descriprion});

    return query.update(newValues);
  }
}
