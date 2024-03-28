import 'package:gallopgate/core/domain/entities/entity.dart';
import 'package:gallopgate/core/domain/entities/profile/profile.dart';
import 'package:gallopgate/core/domain/entities/schedule/schedule_cell.dart';
import 'package:gallopgate/utils/enums/recuperation_status.dart';

class Recuperaion extends IEntity {
  Recuperaion({
    required this.uid,
    required this.date,
    this.status = RecuperationStatus.submitted,
    required this.profile,
    required this.schedule,
  });

  final String uid;
  final DateTime date;
  final RecuperationStatus status;
  final Profile profile;
  final ScheduleCell schedule;
}
