import 'package:gallopgate/v2/models/lecture.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LectureRepository {
  LectureRepository(SupabaseClient client)
      : _query = client.from(Lecture.table);

  final SupabaseQueryBuilder _query;

  Future<Lecture?> fetch(String id) async {
    return _query.select().eq('id', id).maybeSingle().withConverter((record) {
      if (record == null) return null;
      return Lecture.fromJson(record);
    });
  }

  Future<List<Lecture>> fetchAll(String organizationId) async {
    return _query
        .select()
        .eq('organization_id', organizationId)
        .withConverter((records) {
      return records.map(Lecture.fromJson).toList();
    });
  }

  Future<void> create(String title, String descriprion) async {
    return _query.insert({'title': title, 'descriprion': descriprion});
  }

  Future<void> update(String? title, String? descriprion) async {
    Map<String, String> newValues = {};

    if (title != null) newValues.addAll({'title': title});
    if (descriprion != null) newValues.addAll({'descriprion': descriprion});

    return _query.update(newValues);
  }
}
