import 'package:gallopgate/ui/screens/org_details/models/creator_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'org_details_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrgDetailsDto {
  const OrgDetailsDto({
    required this.id,
    required this.name,
    required this.description,
    required this.creator,
    this.logoUrl,
  });

  final String id, name, description;
  final String? logoUrl;
  final CreatorDto creator;

  static const empty = OrgDetailsDto(
    id: '',
    name: '',
    description: '',
    creator: CreatorDto.empty,
  );

  factory OrgDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$OrgDetailsDtoFromJson(json);
}
