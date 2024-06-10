import 'package:equatable/equatable.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/models/role/role.dart';

import 'package:json_annotation/json_annotation.dart';

part 'lesson_member.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class LessonMember extends Equatable {
  const LessonMember({
    this.id,
    required this.profile,
    required this.lesson,
    required this.role,
    this.horse,
  });

  final String? id;
  @JsonKey(toJson: _getProfileId, includeIfNull: false)
  final Profile profile;
  @JsonKey(toJson: _getHorseId, includeIfNull: false)
  final Horse? horse;
  @JsonKey(toJson: _getLessonId, includeIfNull: false)
  final Lesson lesson;
  @JsonKey(toJson: _getRoleId, includeIfNull: false)
  final Role role;

  static const table = 'lesson_members';

  static const LessonMember empty = LessonMember(
    profile: Profile.empty,
    lesson: Lesson.empty,
    role: Role.empty,
  );

  LessonMember copyWith({
    String? id,
    Profile? profile,
    Horse? horse,
    Lesson? lesson,
    Role? role,
  }) {
    return LessonMember(
      id: id ?? this.id,
      profile: profile ?? this.profile,
      horse: horse ?? this.horse,
      lesson: lesson ?? this.lesson,
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [id, profile, horse, lesson, role];

  factory LessonMember.fromJson(Map<String, dynamic> json) =>
      _$LessonMemberFromJson(json);

  Map<String, dynamic> toJson() => _$LessonMemberToJson(this);

  static String? _getProfileId(Profile? profile) => profile?.id;

  static String? _getHorseId(Horse? horse) => horse?.id;

  static String? _getLessonId(Lesson? lesson) => lesson?.id;

  static int? _getRoleId(Role? role) => role?.id;
}
