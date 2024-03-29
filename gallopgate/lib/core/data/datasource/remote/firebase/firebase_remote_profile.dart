import 'package:gallopgate/core/data/datasource/remote/firebase/firebase_remote.dart';

import '../../../../domain/models/model_profile.dart';

class FirebaseRemoteProfile extends FirebaseRemote<Profile> {
  const FirebaseRemoteProfile({required super.firebaseInstance, required super.collection});

  @override
  Profile fromJson(Map<String, dynamic> json) {
    return Profile.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Profile model) {
    return model.toJson();
  }
}