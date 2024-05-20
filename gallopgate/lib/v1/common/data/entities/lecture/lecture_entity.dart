import 'package:json_annotation/json_annotation.dart';

part 'lecture_entity.g.dart';

@JsonSerializable()
class LectureEntity {
  const LectureEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.organizationId,
  });

  final String id, name, description, organizationId;

  static const empty =
      LectureEntity(id: "", name: "", description: "", organizationId: "");

  bool get isEmpty => this == LectureEntity.empty;
  bool get isNotEmpty => this != LectureEntity.empty;

  LectureEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? organizationId,
  }) {
    return LectureEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      organizationId: organizationId ?? this.organizationId,
    );
  }

  factory LectureEntity.fromJson(Map<String, dynamic> json) =>
      _$LectureEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LectureEntityToJson(this);
}
