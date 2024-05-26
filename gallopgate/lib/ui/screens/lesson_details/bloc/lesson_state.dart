part of 'lesson_bloc.dart';

enum LessonStatus { loading, loaded, error }

class LessonState extends Equatable {
  const LessonState._(this.status, this.lesson);

  final LessonStatus status;
  final Lesson lesson;

  factory LessonState.initial() => const LessonState._(
        LessonStatus.loading,
        Lesson.empty,
      );

  LessonState copyWith({
    LessonStatus? status,
    Lesson? lesson,
  }) {
    return LessonState._(
      status ?? this.status,
      lesson ?? this.lesson,
    );
  }

  @override
  List<Object> get props => [status, lesson];
}
