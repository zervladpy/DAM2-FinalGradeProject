import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organization.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Organization extends Equatable {
  const Organization({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.creatorId,
    this.createdAt,
  });

  final String id, name, description, logoUrl, creatorId;
  final DateTime? createdAt;

  static const table = "organizations";

  static const empty = Organization(
    id: '',
    name: '',
    description: '',
    logoUrl: '',
    creatorId: '',
  );

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        logoUrl,
        creatorId,
        createdAt,
      ];
}
