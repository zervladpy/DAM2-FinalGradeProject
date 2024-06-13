part of 'manage_lesson_category_bloc.dart';

class ManageLessonCategoryState extends Equatable {
  const ManageLessonCategoryState._({
    this.status = Status.initial,
    this.lectures = const [],
    this.filtered = const [],
    this.error,
  });

  final Status status;
  final List<LessonCategory> lectures;
  final List<LessonCategory> filtered;
  final String? error;

  factory ManageLessonCategoryState.initial() =>
      const ManageLessonCategoryState._();

  ManageLessonCategoryState copyWith({
    Status? status,
    List<LessonCategory>? lectures,
    List<LessonCategory>? filtered,
    String? error,
  }) {
    return ManageLessonCategoryState._(
      status: status ?? this.status,
      lectures: lectures ?? this.lectures,
      filtered: filtered ?? this.filtered,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, lectures, filtered, error];
}
