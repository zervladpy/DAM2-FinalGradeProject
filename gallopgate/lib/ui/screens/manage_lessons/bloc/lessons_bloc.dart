import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/repositories/lecture_repository.dart';

part 'lessons_event.dart';
part 'lessons_state.dart';

class LessonsBloc extends Bloc<LessonsEvent, LessonsState> {
  final LectureRepository _repository;
  final String id;

  LessonsBloc({
    required LectureRepository repository,
    required this.id,
  })  : _repository = repository,
        super(LessonsState.initial()) {
    on<Fetch>(_fetch);
  }

  FutureOr<void> _fetch(Fetch event, Emitter<LessonsState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final lectures = await _repository.fetchAll(id);

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
