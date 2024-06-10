part of 'lesson_create_bloc.dart';

abstract class LessonCreateEvent extends Equatable {
  const LessonCreateEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends LessonCreateEvent {
  const Fetch({required this.organizationId});

  final String organizationId;

  @override
  List<Object> get props => [organizationId];
}

class TitleChanged extends LessonCreateEvent {
  const TitleChanged({required this.title});

  final String title;

  @override
  List<Object> get props => [title];
}

class CategoryChanged extends LessonCreateEvent {
  const CategoryChanged({required this.category});

  final LessonCategory category;

  @override
  List<Object> get props => [category];
}

class CapacityChanged extends LessonCreateEvent {
  const CapacityChanged({required this.capacity});

  final int capacity;

  @override
  List<Object> get props => [capacity];
}

class StartAtChanged extends LessonCreateEvent {
  const StartAtChanged({required this.startAt});

  final DateTime startAt;

  @override
  List<Object> get props => [startAt];
}

class WeekDayChanged extends LessonCreateEvent {
  const WeekDayChanged({required this.weekDay});

  final int weekDay;

  @override
  List<Object> get props => [weekDay];
}

class DurationChanged extends LessonCreateEvent {
  const DurationChanged({required this.duration});

  final int duration;

  @override
  List<Object> get props => [duration];
}

class AddLessonMemeber extends LessonCreateEvent {
  const AddLessonMemeber();

  @override
  List<Object> get props => [];
}

class MemberChanged extends LessonCreateEvent {
  const MemberChanged({
    required this.index,
    required this.member,
  });

  final int index;
  final LessonMember member;

  @override
  List<Object> get props => [index, member];
}

class RemoveLessonMemeber extends LessonCreateEvent {
  const RemoveLessonMemeber({required this.index});

  final int index;

  @override
  List<Object> get props => [index];
}

class Submit extends LessonCreateEvent {
  const Submit();
}
