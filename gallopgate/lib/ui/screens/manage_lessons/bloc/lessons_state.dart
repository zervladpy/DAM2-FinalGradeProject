part of 'lessons_bloc.dart';

class LessonsState extends Equatable {
  const LessonsState._({
    this.status = Status.initial,
    this.lectures = const [],
    this.filtered = const [],
    this.error,
  });

  final Status status;
  final List<Lesson> lectures;
  final List<Lesson> filtered;
  final String? error;

  factory LessonsState.initial() => const LessonsState._();

  LessonsState copyWith({
    Status? status,
    List<Lesson>? lectures,
    List<Lesson>? filtered,
    String? error,
  }) {
    return LessonsState._(
      status: status ?? this.status,
      lectures: lectures ?? this.lectures,
      filtered: filtered ?? this.filtered,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, lectures, filtered, error];
}
