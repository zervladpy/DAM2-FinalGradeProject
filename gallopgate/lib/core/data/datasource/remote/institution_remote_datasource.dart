import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gallopgate/core/data/datasource/datasource.dart';
import 'package:gallopgate/core/data/models/institution/institution_model.dart';

class FirebaseInstitutionRemoteDatasource
    extends RemoteDataSource<InstitutionModel> {
  const FirebaseInstitutionRemoteDatasource(this.api, this.collection);

  final FirebaseFirestore api;
  final String collection;

  @override
  Future<void> create(InstitutionModel model, String uid) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String uid) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<InstitutionModel?> read(String uid) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<InstitutionModel?> update(InstitutionModel model, String uid) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
