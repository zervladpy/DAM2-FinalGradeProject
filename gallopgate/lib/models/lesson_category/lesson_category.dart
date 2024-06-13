import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/utils/json_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_category.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class LessonCategory extends Equatable {
  const LessonCategory({
    required this.id,
    required this.title,
    required this.description,
    required this.creatorId,
    required this.organizationId,
    this.createdAt,
  });

  @JsonKey(toJson: GJsonUtils.includeIfEmpty)
  final String id;
  final String organizationId;
  final String creatorId;
  final String title;
  @JsonKey(toJson: GJsonUtils.includeIfEmpty)
  final String description;
  final DateTime? createdAt;

  static const table = 'lesson_categories';

  static const LessonCategory empty = LessonCategory(
    id: '',
    title: '',
    description: '',
    creatorId: '',
    organizationId: '',
  );

  factory LessonCategory.fromJson(Map<String, dynamic> json) =>
      _$LessonCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$LessonCategoryToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        creatorId,
        organizationId,
        createdAt,
      ];

  LessonCategory copyWith({
    String? id,
    String? title,
    String? description,
    String? creatorId,
    String? organizationId,
    DateTime? createdAt,
  }) {
    return LessonCategory(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      creatorId: creatorId ?? this.creatorId,
      organizationId: organizationId ?? this.organizationId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
