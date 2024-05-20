import 'package:json_annotation/json_annotation.dart';

part 'organization_entity.g.dart';

@JsonSerializable()
class OrganizationEntity {
  const OrganizationEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    required this.country,
    required this.city,
    required this.street,
    required this.creator,
    required this.users,
  });

  final String id;
  final String name;
  final String description;
  final String logoUrl;
  final String country;
  final String city;
  final String street;
  final String creator;
  final List<String> users;

  OrganizationEntity copyWith({
    String? id,
    String? name,
    String? description,
    String? logoUrl,
    String? country,
    String? city,
    String? street,
    String? creator,
    List<String>? users,
  }) {
    return OrganizationEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      logoUrl: logoUrl ?? this.logoUrl,
      country: country ?? this.country,
      city: city ?? this.city,
      street: street ?? this.street,
      creator: creator ?? this.creator,
      users: users ?? this.users,
    );
  }

  factory OrganizationEntity.fromJson(Map<String, dynamic> json) =>
      _$OrganizationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OrganizationEntityToJson(this);
}
