import 'package:equatable/equatable.dart';
import 'package:gallopgate/models/schedule/schedule.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Lesson extends Equatable {
  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.creatorId,
    this.schedules = const [],
    this.createdAt,
  });

  final String id, title, description, creatorId;
  final DateTime? createdAt;
  @JsonKey(includeToJson: false, includeFromJson: false)
  final List<Schedule> schedules;

  static const table = 'lectures';

  static const empty = Lesson(
    id: '',
    title: '',
    description: '',
    creatorId: '',
  );

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  Map<String, dynamic> toJson() => _$LessonToJson(this);

  Lesson copyWith({
    String? id,
    String? title,
    String? description,
    String? creatorId,
    List<Schedule>? schedules,
    DateTime? createdAt,
  }) {
    return Lesson(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      creatorId: creatorId ?? this.creatorId,
      schedules: schedules ?? this.schedules,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        creatorId,
        schedules,
        createdAt,
      ];
}
