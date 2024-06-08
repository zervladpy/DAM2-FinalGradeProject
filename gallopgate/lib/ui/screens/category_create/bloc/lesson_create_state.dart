part of 'lesson_create_bloc.dart';

class LessonCreateState extends Equatable {
  const LessonCreateState._({
    required this.status,
    required this.lesson,
    this.error,
  });

  final Status status;
  final Lesson lesson;
  final String? error;

  factory LessonCreateState.initial() => const LessonCreateState._(
        status: Status.initial,
        lesson: Lesson.empty,
      );

  LessonCreateState copyWith({
    Status? status,
    Lesson? lesson,
    String? error,
  }) {
    return LessonCreateState._(
      status: status ?? this.status,
      lesson: lesson ?? this.lesson,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, lesson, error];
}
