part of 'manage_lesson_category_bloc.dart';

class ManageLessonCategoryEvent extends Equatable {
  const ManageLessonCategoryEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends ManageLessonCategoryEvent {}

class Filter extends ManageLessonCategoryEvent {
  final String query;

  const Filter(this.query);

  @override
  List<Object> get props => [query];
}
