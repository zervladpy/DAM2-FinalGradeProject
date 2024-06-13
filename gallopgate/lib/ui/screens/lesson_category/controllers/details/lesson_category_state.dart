part of 'lesson_category_bloc.dart';

class LessonCategoryState extends Equatable {
  const LessonCategoryState._({
    this.status = Status.initial,
    this.category = LessonCategory.empty,
    this.error = '',
  });

  final Status status;
  final LessonCategory category;
  final String error;

  factory LessonCategoryState.initial() => const LessonCategoryState._();

  LessonCategoryState copyWith({
    Status? status,
    LessonCategory? category,
    String? error,
  }) {
    return LessonCategoryState._(
      status: status ?? this.status,
      category: category ?? this.category,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [status, category, error];
}
