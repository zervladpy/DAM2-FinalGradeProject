import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/lesson_category/lesson_category.dart';
import 'package:gallopgate/repositories/lesson_category_repository.dart';

part 'lesson_category_event.dart';
part 'lesson_category_state.dart';

class LessonCategoryBloc
    extends Bloc<LessonCategoryEvent, LessonCategoryState> {
  final LessonCategoryRepository _repository;

  LessonCategoryBloc({
    required LessonCategoryRepository repository,
  })  : _repository = repository,
        super(LessonCategoryState.initial()) {
    on<Initialize>(_initialize);
    on<TitleChanged>(_titleChanged);
    on<DescriptionChanged>(_descriptionChanged);
    on<Submit>(_submit);
    on<Delete>(_delete);
  }

  FutureOr<void> _initialize(
    Initialize event,
    Emitter<LessonCategoryState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final category = await _repository.read(event.id);

      log('category: $category');

      emit(state.copyWith(
        status: Status.success,
        category: category,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        error: e.toString(),
      ));
    }

    emit(state.copyWith(status: Status.initial, error: ''));
  }

  FutureOr<void> _titleChanged(
    TitleChanged event,
    Emitter<LessonCategoryState> emit,
  ) {
    emit(state.copyWith(
      category: state.category.copyWith(title: event.title),
    ));
  }

  FutureOr<void> _descriptionChanged(
    DescriptionChanged event,
    Emitter<LessonCategoryState> emit,
  ) {
    emit(state.copyWith(
      category: state.category.copyWith(description: event.description),
    ));
  }

  FutureOr<void> _submit(
    Submit event,
    Emitter<LessonCategoryState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final category = await _repository.update(state.category);

      emit(state.copyWith(
        status: Status.success,
        category: category,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        error: e.toString(),
      ));
    }

    emit(state.copyWith(status: Status.initial, error: ''));
  }

  FutureOr<void> _delete(
    Delete event,
    Emitter<LessonCategoryState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await _repository.delete(state.category.id);

      emit(state.copyWith(
        status: Status.success,
        category: LessonCategory.empty,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        error: e.toString(),
      ));
    }

    emit(state.copyWith(status: Status.initial, error: ''));
  }
}
