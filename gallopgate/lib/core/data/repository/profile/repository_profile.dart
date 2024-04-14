import 'package:gallopgate/core/data/repository/repository.dart';

import '../../../domain/models/model_profile.dart';

class RepositoryProfile extends Repository<Profile, String> {
  const RepositoryProfile({required super.remote});

}