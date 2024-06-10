import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/lesson_category/lesson_category.dart';
import 'package:gallopgate/repositories/lesson_category_repository.dart';

part 'manage_lesson_category_event.dart';
part 'manage_lesson_category_state.dart';

class ManageLessonCategoryBloc
    extends Bloc<ManageLessonCategoryEvent, ManageLessonCategoryState> {
  final LessonCategoryRepository _repository;
  final String id;

  ManageLessonCategoryBloc({
    required LessonCategoryRepository repository,
    required this.id,
  })  : _repository = repository,
        super(ManageLessonCategoryState.initial()) {
    on<Fetch>(_fetch);
  }

  FutureOr<void> _fetch(
      Fetch event, Emitter<ManageLessonCategoryState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final lectures = await _repository.readAll(id);

      emit(state.copyWith(
        status: Status.success,
        lectures: lectures,
        filtered: lectures,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }
}
