import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallopgate/core/data/datasource/datasource.dart';
import 'package:gallopgate/core/data/models/schedule/lecture_model.dart';

class FirebaseLectureRemoteDataSource extends RemoteDataSource<LectureModel> {
  const FirebaseLectureRemoteDataSource(this.api, this.collection);

  final FirebaseFirestore api;
  final String collection;

  @override
  Future<void> create(LectureModel model, String uid) async {
    api.collection(collection).doc(uid).set(model.toJson());
  }

  @override
  Future<void> delete(String uid) async {
    api.collection(collection).doc(uid).delete();
  }

  @override
  Future<LectureModel?> read(String uid) async {
    api.collection(collection).doc(uid).get().then((value) {
      if (value.exists) {
        return LectureModel.fromJson(value.data() as Map<String, dynamic>);
      }
    });

    return null;
  }

  @override
  Future<LectureModel?> update(LectureModel model, String uid) {
    api.collection(collection).doc(uid).update(model.toJson());
    return read(uid);
  }
}
