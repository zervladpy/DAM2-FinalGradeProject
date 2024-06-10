import 'package:equatable/equatable.dart';
import 'package:gallopgate/models/lesson_category/lesson_category.dart';
import 'package:gallopgate/models/lesson_member/lesson_member.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/models/profile/profile.dart';

import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Lesson extends Equatable {
  const Lesson({
    this.id,
    required this.title,
    required this.organization,
    required this.category,
    required this.creator,
    this.capacity = 0,
    this.startAt,
    this.weekday = 0,
    this.duration = 0,
    this.members = const [],
  });

  final String? id;
  final String title;
  @JsonKey(toJson: _getOrganizationId, includeIfNull: false)
  final Organization organization;
  @JsonKey(toJson: _getCategoryId, includeIfNull: false)
  final LessonCategory category;
  @JsonKey(toJson: _getProfileId, includeIfNull: false)
  final Profile creator;
  final int capacity;
  final DateTime? startAt;
  final int weekday;
  final int duration;
  final List<LessonMember> members;

  static const table = 'lessons';

  static const Lesson empty = Lesson(
    title: '',
    organization: Organization.empty,
    category: LessonCategory.empty,
    creator: Profile.empty,
  );

  Lesson copyWith({
    String? id,
    String? title,
    Organization? organization,
    LessonCategory? category,
    Profile? creator,
    int? capacity,
    DateTime? startAt,
    int? weekday,
    int? duration,
    List<LessonMember>? members,
  }) {
    return Lesson(
      id: id ?? this.id,
      title: title ?? this.title,
      organization: organization ?? this.organization,
      category: category ?? this.category,
      creator: creator ?? this.creator,
      capacity: capacity ?? this.capacity,
      startAt: startAt ?? this.startAt,
      weekday: weekday ?? this.weekday,
      duration: duration ?? this.duration,
      members: members ?? this.members,
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
        startAt,
        weekday,
        duration,
        members,
      ];

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);

  Map<String, dynamic> toJson() => _$LessonToJson(this);

  static _getOrganizationId(Organization? organization) => organization?.id;

  static _getCategoryId(LessonCategory? category) => category?.id;

  static _getProfileId(Profile? profile) => profile?.id;
}
