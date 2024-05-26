import 'package:json_annotation/json_annotation.dart';

part 'profile_preview_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class ProfilePreviewDto {
  const ProfilePreviewDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
    required this.roles,
  });

  final String id, firstName, lastName, avatarUrl;
  @JsonKey(defaultValue: [], name: 'profile_role', fromJson: _rolesFromJson)
  final List<String> roles;

  factory ProfilePreviewDto.fromJson(Map<String, dynamic> json) =>
      _$ProfilePreviewDtoFromJson(json);

  static List<String> _rolesFromJson(List<dynamic> profileRoles) {
    List<dynamic> roles = profileRoles.map((role) => role['roles']).toList();
    return roles.map((role) => role['name'] as String).toList();
  }
}
