import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallopgate/v1/common/data/datasources/remote/organization/organization_remote_datasource.dart';
import 'package:gallopgate/v1/common/data/entities/organization/organization_entity.dart';

class OrganizationFirebaseRemoteDatasource
    extends OrganizationRemoteDatasource<FirebaseFirestore> {
  OrganizationFirebaseRemoteDatasource(super.source)
      : ref = source.collection("organization").withConverter(
              fromFirestore: (doc, options) => OrganizationEntity.fromJson(
                doc.data() ?? {},
              ),
              toFirestore: (value, options) => value.toJson(),
            );

  final CollectionReference<OrganizationEntity> ref;

  @override
  Future<OrganizationEntity?> create(OrganizationEntity entity) async {
    String id = await ref.add(entity).then((value) => value.id);
    entity = entity.copyWith(id: id);
    await ref.doc(id).set(entity);

    return entity;
  }

  @override
  Future<OrganizationEntity?> fetch(String id) {
    return ref.doc(id).get().then((value) => value.data());
  }

  @override
  Future<void> update(OrganizationEntity entity) {
    return ref.doc(entity.id).update(entity.toJson());
  }

  @override
  Future<List<OrganizationEntity>> fetchAll() {
    return ref.get().then((value) => value.docs.map((e) => e.data()).toList());
  }
}
