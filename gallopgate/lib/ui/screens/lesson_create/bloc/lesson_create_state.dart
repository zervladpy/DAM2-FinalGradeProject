part of 'lesson_create_bloc.dart';

class LessonCreateState extends Equatable {
  const LessonCreateState._({
    required this.status,
    required this.lesson,
    this.enabled = const {},
    this.opened = const {},
    this.error,
  });

  final Status status;
  final Lesson lesson;
  final String? error;
  final Set<int> opened;
  final Map<int, bool> enabled;

  factory LessonCreateState.initial() => const LessonCreateState._(
        status: Status.initial,
        lesson: Lesson.empty,
      );

  LessonCreateState copyWith({
    Status? status,
    Lesson? lesson,
    Set<int>? opened,
    Map<int, bool>? enabled,
    String? error,
  }) {
    return LessonCreateState._(
      status: status ?? this.status,
      lesson: lesson ?? this.lesson,
      opened: opened ?? this.opened,
      enabled: enabled ?? this.enabled,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, lesson, opened, enabled, error];
}
