import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallopgate/core/domain/models/i_model.dart';

import '../../../../../domain/datasource/base/i_remote_datasource.dart';

abstract class FirebaseRemote<T extends IModel> extends IRemoteDatasource<T, String> {
  const FirebaseRemote({required this.firebaseInstance, required this.collection});
  final FirebaseFirestore firebaseInstance;
  final String collection;

  @override
  Future<bool> create(String id, T model) async {
    return firebaseInstance
        .collection(collection)
        .doc(id)
        .set(toJson(model))
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  @override
  Future<bool> delete(String id) {
    return firebaseInstance
        .collection(collection)
        .doc(id)
        .delete()
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  @override
  Future<T?> find(String id) {
    return firebaseInstance
        .collection(collection)
        .doc(id)
        .get()
        .then((value) {
      if (value.exists) {
        return fromJson(value.data()!);
      }

      return null;
    }).onError((error, stackTrace) => null);
  }

  @override
  Future<List<T>> findAll() {
    return firebaseInstance
        .collection(collection)
        .get()
        .then((value) {
      if (value.size > 0) {
        return value
            .docs
            .map((e) => fromJson(e.data())).toList();
      }

      return List.empty();
    });
  }

  @override
  Future<bool> update(String id, T model) {
    return firebaseInstance
        .collection(collection)
        .doc(id)
        .set(toJson(model))
        .then((value) => true)
        .onError((error, stackTrace) => false);
  }

  Map<String, dynamic> toJson(T model);
  T fromJson(Map<String, dynamic> json);
}