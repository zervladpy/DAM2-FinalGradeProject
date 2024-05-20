import 'package:json_annotation/json_annotation.dart';

part 'lecture.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Lecture {
  Lecture({
    required this.id,
    required this.title,
    required this.descriprion,
    required this.creatorId,
    required this.createdAt,
  });

  final String id, title, descriprion, creatorId;
  final DateTime createdAt;

  static const table = 'lectures';

  static Lecture toCreate(
    String title,
    String descriprion,
  ) {
    return Lecture(
      id: '',
      title: title,
      descriprion: descriprion,
      creatorId: '',
      createdAt: DateTime.now(),
    );
  }

  factory Lecture.fromJson(Map<String, dynamic> json) =>
      _$LectureFromJson(json);

  Map<String, dynamic> toJson() => _$LectureToJson(this);
}
