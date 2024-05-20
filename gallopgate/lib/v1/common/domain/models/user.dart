import 'package:equatable/equatable.dart';
import 'package:gallopgate/v1/resources/enums/role.dart';

/// Application [User]
class User extends Equatable {
  const User({
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

  static const User empty = User(
    id: '',
    email: '',
    name: '',
    photoUrl: '',
    organizationId: '',
    roles: [],
  );

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? photoUrl,
    String? organizationId,
    List<Role>? roles,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      roles: roles ?? this.roles,
      organizationId: organizationId ?? this.organizationId,
    );
  }

  bool get isEmpty => this == User.empty;

  @override
  List<Object?> get props => [id, email, name, photoUrl, roles, organizationId];
}
