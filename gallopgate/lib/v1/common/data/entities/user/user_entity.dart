import 'package:gallopgate/v1/resources/enums/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.photoUrl,
    required this.roles,
    required this.organizationId,
  });

  /// [User] indetificator
  final String id;

  /// [User] stock name
  final String name;

  /// [User] email
  final String email;

  /// [User] avatar photo url
  final String? photoUrl;

  /// [User] roles of type [Role]
  final List<Role> roles;

  final String organizationId;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
