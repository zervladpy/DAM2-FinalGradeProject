import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/utils/json_utils.dart';
import 'package:gallopgate/models/lesson_category/lesson_category.dart';
import 'package:gallopgate/models/lesson_member/lesson_member.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/models/profile/profile_dto.dart';

import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Lesson extends Equatable {
  const Lesson({
    required this.id,
    required this.title,
    this.organization,
    required this.category,
    required this.creator,
    required this.instructor,
    this.capacity = 0,
    this.startAt,
    this.weekday = 0,
    this.duration = 0,
    this.lessonMembers = const [],
  });

  @JsonKey(toJson: GJsonUtils.includeIfEmpty)
  final String id;
  final String title;
  @JsonKey(toJson: _getOrganizationId, includeIfNull: false)
  final Organization? organization;
  @JsonKey(toJson: _getCategoryId, includeIfNull: false)
  final LessonCategory category;
  @JsonKey(toJson: GJsonUtils.getProfileDtoId, includeIfNull: false)
  final ProfileDto creator;
  @JsonKey(toJson: GJsonUtils.getProfileDtoId, includeIfNull: false)
  final ProfileDto instructor;
  final int capacity;
  @JsonKey(
      name: 'start_h',
      toJson: GJsonUtils.toTime,
      fromJson: GJsonUtils.fromTime,
      includeIfNull: false)
  final DateTime? startAt;
  final int weekday;
  final int duration;
  @JsonKey(includeToJson: false)
  final List<LessonMember> lessonMembers;

  static const table = 'lessons';

  static const Lesson empty = Lesson(
    id: '',
    title: '',
    organization: Organization.empty,
    category: LessonCategory.empty,
    creator: ProfileDto.empty,
    instructor: ProfileDto.empty,
  );

  Lesson copyWith({
    String? id,
    String? title,
    Organization? organization,
    LessonCategory? category,
    ProfileDto? creator,
    ProfileDto? instructor,
    int? capacity,
    DateTime? startAt,
    int? weekday,
    int? duration,
    List<LessonMember>? lessonMembers,
  }) {
    return Lesson(
      id: id ?? this.id,
      title: title ?? this.title,
      organization: organization ?? this.organization,
      category: category ?? this.category,
      creator: creator ?? this.creator,
      instructor: instructor ?? this.instructor,
      capacity: capacity ?? this.capacity,
      startAt: startAt ?? this.startAt,
      weekday: weekday ?? this.weekday,
      duration: duration ?? this.duration,
      lessonMembers: lessonMembers ?? this.lessonMembers,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        organization,
        category,
        creator,
        capacity,
        instructor,
        startAt,
        weekday,
        duration,
        lessonMembers,
      ];

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  Map<String, dynamic> toJson() {
    final json = _$LessonToJson(this);

    return json;
  }

  static _getOrganizationId(Organization? organization) => organization?.id;

  static _getCategoryId(LessonCategory? category) => category?.id;

  static _getProfileId(Profile? profile) => profile?.id;
}
