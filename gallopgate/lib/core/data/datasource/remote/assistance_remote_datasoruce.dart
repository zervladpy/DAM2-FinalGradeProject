import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallopgate/core/data/datasource/datasource.dart';
import 'package:gallopgate/core/data/models/assistance/assistance_model.dart';

class FirebaseAssistanceRemoteDataSource
    extends RemoteDataSource<AssistanceModel> {
  const FirebaseAssistanceRemoteDataSource(this.api, this.collection);

  final FirebaseFirestore api;
  final String collection;

  @override
  Future<void> create(AssistanceModel model, String uid) async {
    api.collection(collection).doc(uid).set(model.toJson());
  }

  @override
  Future<void> delete(String uid) async {
    api.collection(collection).doc(uid).delete();
  }

  @override
  Future<AssistanceModel?> read(String uid) async {
    api.collection(collection).doc(uid).get().then((value) {
      if (value.exists) {
        return AssistanceModel.fromJson(value.data() as Map<String, dynamic>);
      }
    });

    return null;
  }

  @override
  Future<AssistanceModel?> update(AssistanceModel model, String uid) async {
    api.collection(collection).doc(uid).update(model.toJson());
    return read(uid);
  }
}
