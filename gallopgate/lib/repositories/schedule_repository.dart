import 'package:gallopgate/common/interfaces/crud_repository.dart';
import 'package:gallopgate/models/schedule/schedule.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ScheduleRepository implements CrudRepository<Schedule, String> {
  ScheduleRepository({required this.client}) {
    query = client.from(Schedule.table);
  }

  final SupabaseClient client;
  late SupabaseQueryBuilder query;

  @override
  Future<Schedule> create(Schedule model) async {
    Schedule schedule = await query
        .insert(model.toJson())
        .select()
        .single()
        .withConverter(Schedule.fromJson);

    return schedule;
  }

  Future<List<Schedule>> createMany(List<Schedule> models) async {
    List<Schedule> schedules = await query
        .insert(models.map((model) => model.toJson()))
        .select()
        .withConverter((rows) {
      return rows.map(Schedule.fromJson).toList();
    });

    return schedules;
  }

  @override
  Future<void> delete(String id) async {
    await query.delete().eq('id', id);
  }

  Future<void> deleteMany(List<String> ids) async {
    await query.delete().inFilter('id', ids);
  }

  @override
  Future<Schedule?> read(String id) async {
    return await query.select().eq('id', id).maybeSingle().withConverter((row) {
      if (row == null) return null;
      return Schedule.fromJson(row);
    });
  }

  Future<List<Schedule>> readFromLesson(String lessonId) async {
    return await query
        .select()
        .eq('lecture_id', lessonId)
        .withConverter((rows) {
      return rows.map(Schedule.fromJson).toList();
    });
  }

  @override
  Future<void> update(Schedule model) async {
    return query.update(model.toJson());
  }
}
