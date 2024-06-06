part of 'lesson_bloc.dart';

class LessonEvent extends Equatable {
  const LessonEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends LessonEvent {
  const Fetch(this.lessonId);

  final String lessonId;

  @override
  List<Object> get props => [lessonId];
}
