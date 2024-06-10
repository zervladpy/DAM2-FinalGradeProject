import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_category.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class LessonCategory extends Equatable {
  const LessonCategory({
    required this.id,
    required this.title,
    required this.description,
    required this.creatorId,
    this.createdAt,
  });

  final String id, title, description, creatorId;
  final DateTime? createdAt;

  static const table = 'lesson_categories';

  static const empty = LessonCategory(
    id: '',
    title: '',
    description: '',
    creatorId: '',
  );

  factory LessonCategory.fromJson(Map<String, dynamic> json) =>
      _$LessonCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$LessonCategoryToJson(this);

  LessonCategory copyWith({
    String? id,
    String? title,
    String? description,
    String? creatorId,
    DateTime? createdAt,
  }) {
    return LessonCategory(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      creatorId: creatorId ?? this.creatorId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        creatorId,
        createdAt,
      ];
}
