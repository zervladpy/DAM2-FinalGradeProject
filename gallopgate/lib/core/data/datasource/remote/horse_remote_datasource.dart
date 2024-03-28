import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallopgate/core/data/datasource/datasource.dart';
import 'package:gallopgate/core/data/models/horse/horse_model.dart';

class FirebaseHorseRemoteDatasource extends RemoteDataSource<HorseModel> {
  FirebaseHorseRemoteDatasource(this.api, this.collection);

  final FirebaseFirestore api;
  final String collection;

  @override
  Future<void> create(HorseModel model, String uid) async {
    api.collection(collection).doc(uid).set(model.toJson());
  }

  @override
  Future<void> delete(String uid) async {
    api.collection(collection).doc(uid).delete();
  }

  @override
  Future<HorseModel?> read(String uid) async {
    api.collection(collection).doc(uid).get().then((value) {
      if (value.exists) {
        return HorseModel.fromJson(value.data() as Map<String, dynamic>);
      }
    });

    return null;
  }

  @override
  Future<HorseModel?> update(HorseModel model, String uid) {
    api.collection(collection).doc(uid).update(model.toJson());
    return read(uid);
  }
}
