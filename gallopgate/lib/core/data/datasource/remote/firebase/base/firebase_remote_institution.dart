import 'package:gallopgate/core/domain/models/model_institution.dart';

import 'firebase_remote.dart';

class FirebaseRemoteInstitution extends FirebaseRemote<Institution> {

  const FirebaseRemoteInstitution({
    required super.firebaseInstance,
    required super.collection,
  });

  @override
  Institution fromJson(Map<String, dynamic> json) {
    return Institution.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Institution model) {
    return model.toJson();
  }
}