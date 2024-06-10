import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'organization.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Organization extends Equatable {
  const Organization({
    this.id,
    required this.name,
    required this.description,
    this.logoUrl,
    this.creatorId,
    this.createdAt,
  });

  final String? id, logoUrl, creatorId;
  final String name, description;
  final DateTime? createdAt;

  static const table = "organizations";

  static const empty = Organization(
    name: '',
    description: '',
    logoUrl: '',
    creatorId: '',
  );

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationToJson(this);

  Organization copyWith({
    String? id,
    String? name,
    String? description,
    String? logoUrl,
    String? creatorId,
    DateTime? createdAt,
  }) {
    return Organization(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      logoUrl: logoUrl ?? this.logoUrl,
      creatorId: creatorId ?? this.creatorId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

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
