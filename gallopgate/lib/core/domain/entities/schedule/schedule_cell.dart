import 'package:gallopgate/core/domain/entities/entity.dart';
import 'package:gallopgate/core/domain/entities/schedule/lecture.dart';
import 'package:gallopgate/utils/enums/week_day.dart';

import '../profile/profile.dart';

class ScheduleCell extends IEntity {
  const ScheduleCell({
    required this.uid,
    required this.weekDay,
    required this.hStart,
    required this.hDuration,
    required this.capactity,
    required this.lecture,
    required this.instructor,
    required this.riders,
  });

  final String uid;
  final WeekDay weekDay;
  final double hStart, hDuration;
  final int capactity;
  final Lecture lecture;
  final Profile instructor;
  final List<Profile> riders;
}
