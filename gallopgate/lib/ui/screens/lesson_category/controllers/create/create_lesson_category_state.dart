part of 'create_lesson_category_bloc.dart';

class CreateLessonCategoryState extends Equatable {
  const CreateLessonCategoryState._({
    this.status = Status.initial,
    this.category = LessonCategory.empty,
    this.error = '',
  });

  final Status status;
  final LessonCategory category;
  final String error;

  factory CreateLessonCategoryState.initial() {
    return const CreateLessonCategoryState._();
  }

  CreateLessonCategoryState copyWith({
    Status? status,
    LessonCategory? category,
    String? error,
  }) {
    return CreateLessonCategoryState._(
      status: status ?? this.status,
      category: category ?? this.category,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, category, error];
}
