import 'package:gallopgate/core/domain/entities/entity.dart';
import 'package:gallopgate/core/domain/entities/horse/horse_details.dart';
import 'package:gallopgate/core/domain/entities/horse/horse_work.dart';
import 'package:gallopgate/core/domain/entities/license/license.dart';

class Horse extends IEntity {
  const Horse({
    required this.uid,
    required this.fullName,
    this.acronym,
    this.license,
    required this.details,
    required this.works,
  });

  final String uid, fullName;
  final String? acronym;
  final License? license;
  final HorseDetails details;
  final List<HorseWork> works;
}
