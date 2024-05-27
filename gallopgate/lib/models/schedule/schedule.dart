import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Schedule extends Equatable {
  const Schedule({
    this.id,
    this.createdAt,
    required this.creatorId,
    required this.instructorId,
    required this.organizationId,
    required this.lectureId,
    required this.weekDay,
    required this.startTime,
    required this.end,
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
  final DateTime end;

  static const table = 'schedules';

  Schedule copyWith({
    String? id,
    DateTime? createdAt,
    String? creatorId,
    String? instructorId,
    String? organizationId,
    String? lectureId,
    int? weekDay,
    DateTime? startTime,
    DateTime? end,
  }) {
    return Schedule(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      creatorId: creatorId ?? this.creatorId,
      instructorId: instructorId ?? this.instructorId,
      organizationId: organizationId ?? this.organizationId,
      lectureId: lectureId ?? this.lectureId,
      weekDay: weekDay ?? this.weekDay,
      startTime: startTime ?? this.startTime,
      end: end ?? this.end,
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        creatorId,
        instructorId,
        organizationId,
        lectureId,
        weekDay,
        startTime,
        end,
      ];

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return _$ScheduleFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$ScheduleToJson(this);
  }
}
