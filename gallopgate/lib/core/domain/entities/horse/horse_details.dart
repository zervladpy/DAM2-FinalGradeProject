import 'package:gallopgate/core/domain/entities/entity.dart';
import 'package:gallopgate/utils/enums/horse_gender.dart';

class HorseDetails extends IEntity {
  const HorseDetails({
    required this.gender,
    required this.weight,
    required this.height,
    required this.birthDate,
  });

  final HorseGender gender;
  final double weight;
  final double height;
  final DateTime birthDate;
}
