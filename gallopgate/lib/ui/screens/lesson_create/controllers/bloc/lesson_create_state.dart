part of 'lesson_create_bloc.dart';

class LessonCreateState extends Equatable {
  const LessonCreateState._({
    this.status = Status.initial,
    this.lesson = Lesson.empty,
    this.categories = const [],
    this.profiles = const [],
    this.horses = const [],
    this.members = const [],
    this.roles = const [],
    this.error,
  });

  final Status status;
  final Lesson lesson;
  final List<LessonCategory> categories;
  final List<Profile> profiles;
  final List<Horse> horses;
  final List<LessonMember> members;
  final List<Role> roles;
  final String? error;

  factory LessonCreateState.initial() => const LessonCreateState._();

  LessonCreateState copyWith({
    Status? status,
    Lesson? lesson,
    List<LessonCategory>? categories,
    List<Profile>? profiles,
    List<Horse>? horses,
    List<LessonMember>? members,
    List<Role>? roles,
    String? error,
  }) {
    return LessonCreateState._(
      status: status ?? this.status,
      lesson: lesson ?? this.lesson,
      categories: categories ?? this.categories,
      profiles: profiles ?? this.profiles,
      horses: horses ?? this.horses,
      members: members ?? this.members,
      roles: roles ?? this.roles,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        lesson,
        categories,
        profiles,
        horses,
        members,
        roles,
        error,
      ];
}
