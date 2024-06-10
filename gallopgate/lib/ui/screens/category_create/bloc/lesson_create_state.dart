part of 'lesson_create_bloc.dart';

class LessonCreateState extends Equatable {
  const LessonCreateState._({
    required this.status,
    required this.category,
    this.error,
  });

  final Status status;
  final LessonCategory category;
  final String? error;

  factory LessonCreateState.initial() => const LessonCreateState._(
        status: Status.initial,
        category: LessonCategory.empty,
      );

  LessonCreateState copyWith({
    Status? status,
    LessonCategory? lesson,
    String? error,
  }) {
    return LessonCreateState._(
      status: status ?? this.status,
      category: lesson ?? this.category,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, category, error];
}
