
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/utils/json_utils.dart';
import 'package:gallopgate/models/role/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Profile extends Equatable {
  const Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarUrl,
    required this.createdAt,
    required this.roles,
    this.organizationId,
    this.birthDate,
  });

  @JsonKey(toJson: GJsonUtils.includeIfEmpty)
  final String id;
  final String firstName, lastName, email, avatarUrl;
  final String? organizationId;
  final DateTime? createdAt;
  final DateTime? birthDate;
  @JsonKey(
    defaultValue: [],
    name: 'profile_role',
    fromJson: mapRoles,
    includeToJson: false,
  )
  final List<Role> roles;

  static const String table = 'profiles';

  static const empty = Profile(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    avatarUrl: '',
    createdAt: null,
    roles: [],
  );

  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;

  Profile copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? avatarUrl,
    DateTime? createdAt,
    List<Role>? roles,
    String? organizationId,
    DateTime? birthDate,
  }) =>
      Profile(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        createdAt: createdAt ?? this.createdAt,
        roles: roles ?? this.roles,
        organizationId: organizationId ?? this.organizationId,
        birthDate: birthDate ?? this.birthDate,
      );

  factory Profile.fromJson(Map<String, dynamic> json) {
    return _$ProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
        avatarUrl,
        createdAt,
        roles,
        organizationId,
        birthDate,
      ];

  @override
  String toString() {
    return 'Profile{id: $id, firstName: $firstName, lastName: $lastName, email: $email, avatarUrl: $avatarUrl, createdAt: $createdAt, roles: $roles, organizationId: $organizationId, birthDate: $birthDate}';
  }

  static List<Role> mapRoles(List<dynamic> json) {
    return json.map((e) => Role.fromJson(e["roles"])).toList();
  }

  String get fullName => {
        if (firstName.isNotEmpty) firstName,
        if (lastName.isNotEmpty) lastName,
      }.join(', ');
}
