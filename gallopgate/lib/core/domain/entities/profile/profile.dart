import 'package:gallopgate/core/domain/entities/entity.dart';
import 'package:gallopgate/core/domain/entities/license/license.dart';

class Profile extends IEntity {
  Profile({
    required this.uid,
    required this.name,
    required this.surname,
    required this.email,
    this.riderLicense,
    this.trainerLicense,
    this.onCharge = const [],
  });

  final String uid, name, surname, email;
  final License? riderLicense, trainerLicense;
  final List<Profile> onCharge;
}
