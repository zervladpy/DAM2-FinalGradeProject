part of 'lesson_bloc.dart';

class LessonState extends Equatable {
  const LessonState._({
    this.status = Status.initial,
    this.creator = Profile.empty,
    this.lesson = Lesson.empty,
    this.error,
  });

  final Status status;
  final Profile creator;
  final Lesson lesson;
  final String? error;

  factory LessonState.initial() => const LessonState._();

  LessonState copyWith({
    Status? status,
    Profile? creator,
    Lesson? lesson,
    String? error,
  }) {
    return LessonState._(
      status: status ?? this.status,
      creator: creator ?? this.creator,
      lesson: lesson ?? this.lesson,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, lesson, creator, error];
}
