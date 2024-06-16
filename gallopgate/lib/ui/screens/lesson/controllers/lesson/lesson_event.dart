part of 'lesson_bloc.dart';

abstract class LessonEvent extends Equatable {
  const LessonEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends LessonEvent {
  final String id;
  final String organizationId;

  const Fetch(this.id, this.organizationId);

  @override
  List<Object> get props => [id, organizationId];
}

class TitleChanged extends LessonEvent {
  const TitleChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

class CategoryChanged extends LessonEvent {
  const CategoryChanged(this.value);

  final LessonCategory value;

  @override
  List<Object> get props => [value];
}

class InstructorChanged extends LessonEvent {
  const InstructorChanged(this.value);

  final Profile value;

  @override
  List<Object> get props => [value];
}

class StartAtChanged extends LessonEvent {
  const StartAtChanged(this.value);

  final DateTime value;

  @override
  List<Object> get props => [value];
}

class DurationChanged extends LessonEvent {
  const DurationChanged(this.value);

  final DateTime value;

  @override
  List<Object> get props => [value];
}

class CapacityChanged extends LessonEvent {
  const CapacityChanged(this.value);

  final int value;

  @override
  List<Object> get props => [value];
}

class WeekdayChanged extends LessonEvent {
  const WeekdayChanged(this.value);

  final int value;

  @override
  List<Object> get props => [value];
}

class AddMember extends LessonEvent {
  const AddMember(this.value);

  final LessonMember value;

  @override
  List<Object> get props => [value];
}

class RemoveMember extends LessonEvent {
  const RemoveMember(this.value);

  final LessonMember value;

  @override
  List<Object> get props => [value];
}

class UpdateMember extends LessonEvent {
  const UpdateMember(this.value);

  final LessonMember value;

  @override
  List<Object> get props => [value];
}

class Update extends LessonEvent {
  const Update();
}

class Delete extends LessonEvent {
  const Delete();
}

class Refresh extends LessonEvent {
  const Refresh();
}
