import 'package:gallopgate/core/domain/entities/entity.dart';
import 'package:gallopgate/core/domain/entities/profile/profile.dart';
import 'package:gallopgate/core/domain/entities/schedule/schedule_cell.dart';

class Assistance extends IEntity {
  Assistance({
    required this.uid,
    required this.date,
    required this.justified,
    required this.profile,
    required this.schedule,
  });

  final String uid;
  final DateTime date;
  final bool justified;
  final Profile profile;
  final ScheduleCell schedule;
}
