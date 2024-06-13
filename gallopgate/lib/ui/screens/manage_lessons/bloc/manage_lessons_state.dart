part of 'manage_lessons_bloc.dart';

class ManageLessonsState extends Equatable {
  const ManageLessonsState({
    this.status = Status.initial,
    this.lessons = const [],
    this.error,
  });

  final Status status;
  final List<LessonDto> lessons;
  final String? error;

  factory ManageLessonsState.initial() => const ManageLessonsState();

  ManageLessonsState copyWith({
    Status? status,
    List<LessonDto>? lessons,
    String? error,
  }) {
    return ManageLessonsState(
      status: status ?? this.status,
      lessons: lessons ?? this.lessons,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, lessons, error];
}
