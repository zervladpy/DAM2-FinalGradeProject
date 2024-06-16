part of 'schedule_bloc.dart';

class ScheduleState extends Equatable {
  const ScheduleState._({
    this.status = Status.initial,
    this.lessons = const <Lesson>[],
    this.error = '',
  });

  final Status status;
  final List<Lesson> lessons;
  final String error;

  factory ScheduleState.initial() {
    return const ScheduleState._();
  }

  ScheduleState copyWith({
    Status? status,
    List<Lesson>? lessons,
    String? error,
  }) {
    return ScheduleState._(
      status: status ?? this.status,
      lessons: lessons ?? this.lessons,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, lessons, error];
}
