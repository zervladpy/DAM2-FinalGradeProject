import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/repositories/lecture_repository.dart';

part 'lesson_create_event.dart';
part 'lesson_create_state.dart';

class LessonCreateBloc extends Bloc<LessonCreateEvent, LessonCreateState> {
  final String organizationId;
  final LectureRepository lectureRepository;

  LessonCreateBloc(
    this.organizationId,
    this.lectureRepository,
  ) : super(LessonCreateState.initial()) {
    on<LessonTitleChanged>(_titleChanged);
    on<LessonDescriptionChanged>(_descriptionChanged);
    on<LessonSubmit>(_onSubmitt);
  }

  FutureOr<void> _titleChanged(
    LessonTitleChanged event,
    Emitter<LessonCreateState> emit,
  ) {
    emit(state.copyWith(
      lesson: state.lesson.copyWith(title: event.value),
    ));
  }

  FutureOr<void> _descriptionChanged(
    LessonDescriptionChanged event,
    Emitter<LessonCreateState> emit,
  ) {
    emit(state.copyWith(
      lesson: state.lesson.copyWith(description: event.value),
    ));
  }

  FutureOr<void> _onSubmitt(
    LessonSubmit event,
    Emitter<LessonCreateState> emit,
  ) {
    emit(state.copyWith(status: Status.loading));

    try {
      lectureRepository.create(
        state.lesson.title,
        state.lesson.description,
        organizationId,
      );

      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }
}
