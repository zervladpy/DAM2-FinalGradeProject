import 'package:json_annotation/json_annotation.dart';

part 'lesson_preview_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class LessonPreviewDto {
  LessonPreviewDto({
    required this.id,
    required this.title,
  });

  final String id, title;

  factory LessonPreviewDto.fromJson(Map<String, dynamic> json) =>
      _$LessonPreviewDtoFromJson(json);
}
