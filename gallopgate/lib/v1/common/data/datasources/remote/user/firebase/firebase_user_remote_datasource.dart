import 'package:gallopgate/v1/common/data/datasources/remote/user/user_remote_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallopgate/v1/common/data/entities/user/user_entity.dart';

class FirebaseUserRemoteDatasource
    extends UserRemoteDatasource<FirebaseFirestore> {
  FirebaseUserRemoteDatasource(super.source)
      : ref = source.collection("users").withConverter<UserEntity>(
              fromFirestore: (doc, opt) => UserEntity.fromJson(
                doc.data() ?? {},
              ),
              toFirestore: (entity, opt) => entity.toJson(),
            );

  final CollectionReference<UserEntity> ref;

  @override
  Future<UserEntity?> create(UserEntity data) {
    ref.doc(data.id).set(data);
    return fetchOne(data.id);
  }

  @override
  Future<List<UserEntity>> fetchMany(List<String> ids) {
    List<Future<UserEntity?>> futures = [];
    for (var i = 0; i < ids.length; i++) {
      futures.add(fetchOne(ids[i]));
    }

    return Future.wait(Iterable.castFrom(futures));
  }

  @override
  Future<UserEntity?> fetchOne(String id) {
    return ref.doc(id).get().then((value) => value.data());
  }

  @override
  Future<UserEntity?> update(UserEntity data) {
    ref.doc(data.id).update(data.toJson());
    return fetchOne(data.id);
  }
}
