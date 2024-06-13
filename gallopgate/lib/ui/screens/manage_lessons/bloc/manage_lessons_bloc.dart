import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/lesson/lesson_dto.dart';
import 'package:gallopgate/repositories/lesson_repository.dart';

part 'manage_lessons_event.dart';
part 'manage_lessons_state.dart';

class ManageLessonsBloc extends Bloc<ManageLessonsEvent, ManageLessonsState> {
  final LessonRepository _repository;

  ManageLessonsBloc({
    required LessonRepository repository,
  })  : _repository = repository,
        super(ManageLessonsState.initial()) {
    on<Fetch>(_fetch);
  }

  FutureOr<void> _fetch(
    Fetch event,
    Emitter<ManageLessonsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final lessons = await _repository.readAllDto(event.organizationId);

      emit(state.copyWith(
        status: Status.loaded,
        lessons: lessons,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        error: e.toString(),
      ));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }
}
