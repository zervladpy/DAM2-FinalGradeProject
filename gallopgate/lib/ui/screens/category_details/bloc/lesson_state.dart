part of 'lesson_bloc.dart';

class LessonState extends Equatable {
  const LessonState._({
    this.status = Status.initial,
    this.creator = Profile.empty,
    this.lesson = LessonCategory.empty,
    this.intitial = LessonCategory.empty,
    this.error,
  });

  final Status status;
  final Profile creator;
  final LessonCategory intitial;
  final LessonCategory lesson;
  final String? error;

  factory LessonState.initial() => const LessonState._();

  LessonState copyWith({
    Status? status,
    Profile? creator,
    LessonCategory? lesson,
    LessonCategory? intitial,
    String? error,
  }) {
    return LessonState._(
      status: status ?? this.status,
      creator: creator ?? this.creator,
      lesson: lesson ?? this.lesson,
      intitial: intitial ?? this.intitial,
      error: error,
    );
  }

  bool get isEdited => lesson != intitial;

  @override
  List<Object?> get props => [status, lesson, intitial, creator, error];
}
