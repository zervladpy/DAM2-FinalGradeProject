import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Schedule {
  Schedule({
    required this.id,
    required this.organizationId,
    required this.lectureId,
    required this.createdAt,
    this.creatorId,
  });

  final String id, organizationId, lectureId;
  final String? creatorId;
  final DateTime createdAt;

  static const table = "schedules";

  static Schedule toCreate(
    String organizationId,
    String lectureId,
  ) {
    return Schedule(
      id: '',
      organizationId: organizationId,
      lectureId: lectureId,
      creatorId: '',
      createdAt: DateTime.now(),
    );
  }

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
