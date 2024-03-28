import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallopgate/core/data/datasource/datasource.dart';
import 'package:gallopgate/core/data/models/schedule/schedule_cell_model.dart';

class FirebaseScheduleRemoteDataSource
    extends RemoteDataSource<ScheduleCellModel> {
  const FirebaseScheduleRemoteDataSource(this.api, this.collection);

  final FirebaseFirestore api;
  final String collection;

  @override
  Future<void> create(ScheduleCellModel model, String uid) async {
    api.collection(collection).doc(uid).set(model.toJson());
  }

  @override
  Future<void> delete(String uid) async {
    api.collection(collection).doc(uid).delete();
  }

  @override
  Future<ScheduleCellModel?> read(String uid) async {
    api.collection(collection).doc(uid).get().then((value) {
      if (value.exists) {
        return ScheduleCellModel.fromJson(value.data() as Map<String, dynamic>);
      }
    });

    return null;
  }

  @override
  Future<ScheduleCellModel?> update(ScheduleCellModel model, String uid) async {
    api.collection(collection).doc(uid).update(model.toJson());
    return read(uid);
  }
}
