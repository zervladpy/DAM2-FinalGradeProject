import 'package:json_annotation/json_annotation.dart';

part 'explore_organizations_dto.g.dart';

@JsonSerializable()
class ExploreOrganizationDto {
  const ExploreOrganizationDto({
    required this.id,
    required this.name,
    required this.description,
  });

  final String id, name, description;

  factory ExploreOrganizationDto.fromJson(Map<String, dynamic> json) =>
      _$ExploreOrganizationDtoFromJson(json);
}
