import 'package:gallopgate/core/domain/entities/entity.dart';

class HorseWork extends IEntity {
  HorseWork({
    required this.date,
    required this.time,
  });

  final DateTime date;
  final double time;
}
