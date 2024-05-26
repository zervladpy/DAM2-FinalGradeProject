import 'package:json_annotation/json_annotation.dart';

part 'creator_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CreatorDto {
  const CreatorDto({
    required this.name,
    this.avatarUrl,
  });

  final String name;
  final String? avatarUrl;

  static const empty = CreatorDto(name: '');

  factory CreatorDto.fromJson(Map<String, dynamic> json) =>
      _$CreatorDtoFromJson(json);
}
