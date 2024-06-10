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

class LessonSubmit extends LessonCreateEvent {
  const LessonSubmit();
}
