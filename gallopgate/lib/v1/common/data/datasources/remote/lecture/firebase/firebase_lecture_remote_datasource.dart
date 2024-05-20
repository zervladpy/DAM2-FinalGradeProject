import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallopgate/v1/common/data/datasources/remote/lecture/lecture_remote_datasource.dart';
import 'package:gallopgate/v1/common/data/entities/lecture/lecture_entity.dart';

class FirebaseLectureRemoteDataSource
    extends LectureRemoteDatasource<FirebaseFirestore> {
  FirebaseLectureRemoteDataSource(super.source)
      : ref = source.collection("lectures").withConverter(
              fromFirestore: (snapshot, options) => LectureEntity.fromJson(
                snapshot.data() ?? {},
              ),
              toFirestore: (value, options) => value.toJson(),
            );

  final CollectionReference<LectureEntity> ref;

  @override
  Future<LectureEntity?> create(LectureEntity entity) async {
    String id = await ref.add(entity).then((value) => value.id);

    entity = entity.copyWith(id: id);

    return update(entity);
  }

  @override
  Future<void> delete(String id) {
    return ref.doc(id).delete();
  }

  @override
  Future<LectureEntity?> fetch(String id) {
    return ref.doc(id).get().then((value) => value.data());
  }

  @override
  Future<List<LectureEntity>> fetchMany(List<String> ids) {
    return ref.where(FieldPath.documentId, whereIn: ids).get().then(
          (value) => value.docs.map((e) => e.data()).toList(),
        );
  }

  @override
  Future<LectureEntity?> update(LectureEntity entity) {
    return ref.doc(entity.id).set(entity).then((_) => fetch(entity.id));
  }
}
