import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'lesson_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class LessonDto extends Equatable {
  const LessonDto({
    required this.id,
    required this.title,
    required this.categoryTitle,
  });

  static const String query = 'id, title, lesson_categories (title)';

  final String id;
  final String title;
  @JsonKey(name: 'lesson_categories', fromJson: _getCategoryTitle)
  final String categoryTitle;

  static const LessonDto empty = LessonDto(
    id: '',
    title: '',
    categoryTitle: '',
  );

  factory LessonDto.fromJson(Map<String, dynamic> json) =>
      _$LessonDtoFromJson(json);

  @override
  List<Object> get props => [id, title, categoryTitle];

  static String _getCategoryTitle(Map<String, dynamic>? json) {
    if (json == null) return '';
    return json['title'];
  }
}
