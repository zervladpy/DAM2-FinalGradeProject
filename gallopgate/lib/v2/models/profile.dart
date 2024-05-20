import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Profile {
  const Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarUrl,
    required this.createdAt,
    this.organizationId,
    this.birthDate,
  });

  final String id, firstName, lastName, email, avatarUrl;
  final String? organizationId;
  final DateTime? createdAt;
  final DateTime? birthDate;

  static const String table = 'profiles';

  static const empty = Profile(
    id: '',
    firstName: '',
    lastName: '',
    email: '',
    avatarUrl: '',
    createdAt: null,
  );

  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
