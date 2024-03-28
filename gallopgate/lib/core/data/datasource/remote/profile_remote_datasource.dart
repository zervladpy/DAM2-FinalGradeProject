import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:gallopgate/core/data/datasource/datasource.dart';
import 'package:gallopgate/core/data/models/profile/profile_model.dart';

class FirebaseProfileRemoteDatasource extends RemoteDataSource<ProfileModel> {
  const FirebaseProfileRemoteDatasource(this.api, this.collection);

  final FirebaseFirestore api;
  final String collection;

  @override
  Future<void> create(ProfileModel model, String uid) async {
    api.collection(collection).doc(uid).set(model.toJson());
  }

  @override
  Future<void> delete(String uid) async {
    api.collection(collection).doc(uid).delete();
  }

  @override
  Future<ProfileModel?> read(String uid) async {
    api.collection(collection).doc(uid).get().then((value) {
      if (value.exists) {
        return ProfileModel.fromJson(value.data() as Map<String, dynamic>);
      }
    });

    return null;
  }

  @override
  Future<ProfileModel?> update(ProfileModel model, String uid) {
    api.collection(collection).doc(uid).update(model.toJson());
    return read(uid);
  }
}
