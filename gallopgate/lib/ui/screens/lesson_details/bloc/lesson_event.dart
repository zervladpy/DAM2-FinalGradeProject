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

class TitleChanged extends LessonEvent {
  const TitleChanged(this.title);

  final String title;

  @override
  List<Object> get props => [title];
}

class DescriptionChanged extends LessonEvent {
  const DescriptionChanged(this.description);

  final String description;

  @override
  List<Object> get props => [description];
}

class Update extends LessonEvent {
  const Update();
}
