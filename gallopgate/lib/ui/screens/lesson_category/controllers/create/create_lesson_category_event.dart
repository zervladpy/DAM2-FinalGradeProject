part of 'create_lesson_category_bloc.dart';

abstract class CreateLessonCategoryEvent extends Equatable {
  const CreateLessonCategoryEvent();

  @override
  List<Object> get props => [];
}

class Initialize extends CreateLessonCategoryEvent {
  final Profile creator;
  final Organization organization;

  const Initialize({
    required this.creator,
    required this.organization,
  });

  @override
  List<Object> get props => [creator, organization];
}

class TitleChaged extends CreateLessonCategoryEvent {
  final String title;

  const TitleChaged({
    required this.title,
  });

  @override
  List<Object> get props => [title];
}

class DescriptionChanged extends CreateLessonCategoryEvent {
  final String description;

  const DescriptionChanged({
    required this.description,
  });

  @override
  List<Object> get props => [description];
}

class Submit extends CreateLessonCategoryEvent {
  const Submit();
}
