import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Schedule {
  const Schedule({
    this.id,
    this.createdAt,
    required this.creatorId,
    required this.instructorId,
    required this.organizationId,
    required this.lectureId,
    required this.weekDay,
    required this.startTime,
    required this.duration,
  });

  @JsonKey(includeIfNull: false)
  final String? id;
  @JsonKey(includeIfNull: false)
  final DateTime? createdAt;
  final String organizationId;
  final String lectureId;
  final String instructorId;
  final int weekDay;
  @JsonKey(includeIfNull: false)
  final String? creatorId;
  final DateTime startTime;
  final DateTime duration;

  static const table = 'schedules';

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return _$ScheduleFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ScheduleToJson(this);
  }
}
