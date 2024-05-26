part of 'lesson_bloc.dart';

class LessonEvent extends Equatable {
  const LessonEvent();

  @override
  List<Object> get props => [];
}

class LessonEventFetch extends LessonEvent {
  const LessonEventFetch(this.lessonId);

  final String lessonId;

  @override
  List<Object> get props => [lessonId];
}
