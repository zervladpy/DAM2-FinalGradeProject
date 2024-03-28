import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallopgate/core/data/datasource/datasource.dart';
import 'package:gallopgate/core/data/models/recuperation/recuperation_model.dart';

class FirebaseRecuperationRemoteDatasource
    extends RemoteDataSource<RecuperationModel> {
  const FirebaseRecuperationRemoteDatasource(this.api, this.collection);

  final FirebaseFirestore api;
  final String collection;

  @override
  Future<void> create(RecuperationModel model, String uid) async {
    api.collection(collection).doc(uid).set(model.toJson());
  }

  @override
  Future<void> delete(String uid) async {
    api.collection(collection).doc(uid).delete();
  }

  @override
  Future<RecuperationModel?> read(String uid) async {
    api.collection(collection).doc(uid).get().then((value) {
      if (value.exists) {
        return RecuperationModel.fromJson(value.data() as Map<String, dynamic>);
      }
    });

    return null;
  }

  @override
  Future<RecuperationModel?> update(RecuperationModel model, String uid) {
    api.collection(collection).doc(uid).update(model.toJson());
    return read(uid);
  }
}
