import 'package:json_annotation/json_annotation.dart';

part 'horse_preview_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class HorsePreviewDto {
  HorsePreviewDto({
    required this.id,
    required this.fullName,
    required this.alias,
  });

  final String id, fullName, alias;

  factory HorsePreviewDto.fromJson(Map<String, dynamic> json) =>
      _$HorsePreviewDtoFromJson(json);
}
