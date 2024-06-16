part of 'lesson_bloc.dart';

class LessonState extends Equatable {
  const LessonState._({
    this.status = Status.initial,
    this.lesson = Lesson.empty,
    this.instructors = const [],
    this.riders = const [],
    this.categories = const [],
    this.horses = const [],
    this.error = '',
  });

  final Status status;
  final Lesson lesson;
  final List<Profile> instructors;
  final List<Profile> riders;
  final List<LessonCategory> categories;
  final List<Horse> horses;
  final String error;

  factory LessonState.initial() => const LessonState._();

  LessonState copyWith({
    Status? status,
    Lesson? lesson,
    List<Profile>? instructors,
    List<Profile>? riders,
    List<LessonCategory>? categories,
    List<Horse>? horses,
    String? error,
  }) {
    return LessonState._(
      status: status ?? this.status,
      lesson: lesson ?? this.lesson,
      instructors: instructors ?? this.instructors,
      riders: riders ?? this.riders,
      categories: categories ?? this.categories,
      horses: horses ?? this.horses,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        status,
        lesson,
        error,
        instructors,
        riders,
        categories,
        horses,
      ];
}
