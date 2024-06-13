import 'dart:developer';

import 'package:gallopgate/models/lesson_category/lesson_category.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LessonCategoryRepository {
  LessonCategoryRepository({
    required SupabaseClient client,
  })  : _client = client,
        _query = client.from(LessonCategory.table);

  final SupabaseClient _client; // ignore: unused_field
  final SupabaseQueryBuilder _query;

  Future<LessonCategory> create(LessonCategory model) async {
    log(model.toJson().toString());
    return await _query
        .insert(model.toJson())
        .select()
        .single()
        .withConverter(LessonCategory.fromJson);
  }

  Future<void> delete(String id) async {
    await _query.delete().eq('id', id);
  }

  Future<LessonCategory?> read(String id) async {
    return await _query
        .select()
        .eq('id', id)
        .maybeSingle()
        .withConverter((row) {
      if (row == null) return null;
      log(row.toString());
      return LessonCategory.fromJson(row);
    });
  }

  Future<List<LessonCategory>> readAll(String organizationId) async {
    final categories = await _query
        .select()
        .eq('organization_id', organizationId)
        .withConverter(
          (rows) => rows.map((row) => LessonCategory.fromJson(row)).toList(),
        );

    return categories;
  }

  Future<LessonCategory?> update(LessonCategory model) async {
    return await _query
        .update(model.toJson())
        .eq('id', model.id)
        .maybeSingle()
        .withConverter(
      (row) {
        if (row == null) return null;
        return LessonCategory.fromJson(row);
      },
    );
  }
}
