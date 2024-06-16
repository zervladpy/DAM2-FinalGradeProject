import 'package:equatable/equatable.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/lesson/lesson_dto.dart';
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
    required this.horse,
  });

  final String? id;
  @JsonKey(toJson: _getProfileId, includeIfNull: false)
  final Profile profile;
  @JsonKey(toJson: _getHorseId, includeIfNull: false)
  final Horse horse;
  final String lesson;

  static const table = 'lesson_members';

  static const LessonMember empty = LessonMember(
    profile: Profile.empty,
    horse: Horse.empty,
    lesson: '',
  );

  LessonMember copyWith({
    String? id,
    Profile? profile,
    Horse? horse,
    String? lesson,
    Role? role,
  }) {
    return LessonMember(
      id: id ?? this.id,
      profile: profile ?? this.profile,
      horse: horse ?? this.horse,
      lesson: lesson ?? this.lesson,
    );
  }

  @override
  List<Object?> get props => [id, profile, horse, lesson];

  factory LessonMember.fromJson(Map<String, dynamic> json) =>
      _$LessonMemberFromJson(json);

  Map<String, dynamic> toJson() => _$LessonMemberToJson(this);

  static String? _getProfileId(Profile? profile) => profile?.id;

  static String? _getHorseId(Horse? horse) => horse?.id;

  static String? _getLessonId(LessonDto? lesson) => lesson?.id;
}
