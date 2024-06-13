import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'profile_dto.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class ProfileDto extends Equatable {
  const ProfileDto({
    required this.id,
    required this.name,
    required this.email,
    required this.lastName,
    required this.avatarUrl,
  });

  final String id;
  final String name;
  final String lastName;
  final String email;
  final String avatarUrl;

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);

  @override
  List<Object> get props => [id, name, email, lastName, avatarUrl];
}
