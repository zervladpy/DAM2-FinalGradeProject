part of 'lesson_category_bloc.dart';

abstract class LessonCategoryEvent extends Equatable {
  const LessonCategoryEvent();

  @override
  List<Object> get props => [];
}

class Initialize extends LessonCategoryEvent {
  const Initialize({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class TitleChanged extends LessonCategoryEvent {
  const TitleChanged({required this.title});

  final String title;

  @override
  List<Object> get props => [title];
}

class DescriptionChanged extends LessonCategoryEvent {
  const DescriptionChanged({required this.description});

  final String description;

  @override
  List<Object> get props => [description];
}

class Submit extends LessonCategoryEvent {
  const Submit();
}

class Delete extends LessonCategoryEvent {
  const Delete();
}
