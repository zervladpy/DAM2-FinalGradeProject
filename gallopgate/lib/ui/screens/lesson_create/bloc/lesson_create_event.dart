part of 'lesson_create_bloc.dart';

abstract class LessonCreateEvent extends Equatable {
  const LessonCreateEvent();

  @override
  List<Object?> get props => [];
}

class LessonTitleChanged extends LessonCreateEvent {
  const LessonTitleChanged(this.value);
  final String value;

  @override
  List<Object> get props => [value];
}

class LessonDescriptionChanged extends LessonCreateEvent {
  const LessonDescriptionChanged(this.value);
  final String value;

  @override
  List<Object> get props => [value];
}

class LessonTiggerOpen extends LessonCreateEvent {
  const LessonTiggerOpen(this.value);
  final int value;

  @override
  List<Object> get props => [value];
}

class LessonTriggerEnabled extends LessonCreateEvent {
  const LessonTriggerEnabled(this.index, this.value);
  final int index;
  final bool value;

  @override
  List<Object> get props => [index, value];
}

class LessonUpdateSchedule extends LessonCreateEvent {
  const LessonUpdateSchedule(this.value);

  final Schedule value;

  @override
  List<Object> get props => [value];
}

class LessonAddNewScheduleToDay extends LessonCreateEvent {
  const LessonAddNewScheduleToDay(this.value);

  final int value;

  @override
  List<Object> get props => [value];
}

class LessonRemoveSchedule extends LessonCreateEvent {
  const LessonRemoveSchedule(this.value);

  final Schedule value;

  @override
  List<Object> get props => [value];
}

class LessonSubmit extends LessonCreateEvent {
  const LessonSubmit();
}
