import 'package:json_annotation/json_annotation.dart';

part 'organization.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Organization {
  Organization({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.creatorId,
    required this.createdAt,
  });

  final String id, name, description, logoUrl, creatorId;
  final DateTime createdAt;

  static const table = "organizations";

  static Organization toCreate(
    String name,
    String description,
  ) {
    return Organization(
      id: '',
      name: name,
      description: description,
      logoUrl: '',
      creatorId: '',
      createdAt: DateTime.now(),
    );
  }

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);
}
