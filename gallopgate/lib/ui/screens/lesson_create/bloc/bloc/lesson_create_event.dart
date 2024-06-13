part of 'lesson_create_bloc.dart';

abstract class LessonCreateEvent extends Equatable {
  const LessonCreateEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends LessonCreateEvent {
  const Fetch();
}

class TitleChanged extends LessonCreateEvent {
  final String title;

  const TitleChanged({required this.title});

  @override
  List<Object> get props => [title];
}

class CategoryChanged extends LessonCreateEvent {
  final LessonCategory category;

  const CategoryChanged({required this.category});

  @override
  List<Object> get props => [category];
}

class CapcaityChanged extends LessonCreateEvent {
  final int capacity;

  const CapcaityChanged({required this.capacity});

  @override
  List<Object> get props => [capacity];
}

class StartAtChanged extends LessonCreateEvent {
  final DateTime startAt;

  const StartAtChanged({required this.startAt});

  @override
  List<Object> get props => [startAt];
}

class WeekdayChanged extends LessonCreateEvent {
  final int weekday;

  const WeekdayChanged({required this.weekday});

  @override
  List<Object> get props => [weekday];
}

class DurationChanged extends LessonCreateEvent {
  final int duration;

  const DurationChanged({required this.duration});

  @override
  List<Object> get props => [duration];
}

class InstructorChanged extends LessonCreateEvent {
  final Profile instructor;

  const InstructorChanged({required this.instructor});

  @override
  List<Object> get props => [instructor];
}

class Submit extends LessonCreateEvent {
  const Submit();
}
