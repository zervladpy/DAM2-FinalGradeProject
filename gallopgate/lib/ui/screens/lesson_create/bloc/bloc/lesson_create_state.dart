part of 'lesson_create_bloc.dart';

class LessonCreateState extends Equatable {
  const LessonCreateState._({
    this.status = Status.initial,
    this.lesson = Lesson.empty,
    this.categories = const [],
    this.instructors = const [],
    this.error = '',
  });

  final Status status;
  final Lesson lesson;
  final List<LessonCategory> categories;
  final List<Profile> instructors;
  final String error;

  factory LessonCreateState.initial() => const LessonCreateState._();

  LessonCreateState copyWith({
    Status? status,
    Lesson? lesson,
    List<LessonCategory>? categories,
    List<Profile>? instructors,
    String? error,
  }) {
    return LessonCreateState._(
      status: status ?? this.status,
      lesson: lesson ?? this.lesson,
      categories: categories ?? this.categories,
      instructors: instructors ?? this.instructors,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, lesson, categories, instructors, error];
}
