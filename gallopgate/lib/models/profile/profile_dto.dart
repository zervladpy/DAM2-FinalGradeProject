import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'profile_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ProfileDto extends Equatable {
  const ProfileDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatarUrl,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatarUrl;

  static const empty = ProfileDto(
    id: '',
    firstName: '',
    email: '',
    lastName: '',
    avatarUrl: '',
  );

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);

  @override
  List<Object> get props => [id, firstName, email, lastName, avatarUrl];
}
