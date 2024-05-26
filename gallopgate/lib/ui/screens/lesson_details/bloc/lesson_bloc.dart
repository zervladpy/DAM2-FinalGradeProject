import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/repositories/lecture_repository.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LectureRepository repository;

  LessonBloc(this.repository) : super(LessonState.initial()) {
    on<LessonEventFetch>(_fetch);
  }

  FutureOr<void> _fetch(
    LessonEventFetch event,
    Emitter<LessonState> emit,
  ) async {
    emit(state.copyWith(status: LessonStatus.loading));

    try {
      final lesson = await repository.fetch(event.lessonId);

      log(lesson.toString());

      if (lesson == null) throw Exception('Lesson not found');

      emit(state.copyWith(status: LessonStatus.loaded, lesson: lesson));
    } catch (e) {
      emit(state.copyWith(status: LessonStatus.error));
    }
  }
}
