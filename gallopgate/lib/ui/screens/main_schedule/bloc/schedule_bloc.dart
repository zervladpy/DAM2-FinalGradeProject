import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/repositories/lesson_repository.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  final LessonRepository _lessonRepository;
  final Profile _profile;

  ScheduleBloc({
    required LessonRepository lessonRepository,
    required Profile profile,
  })  : _lessonRepository = lessonRepository,
        _profile = profile,
        super(ScheduleState.initial()) {
    on<Fetch>(_fetch);
  }

  FutureOr<void> _fetch(
    Fetch event,
    Emitter<ScheduleState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      var lessons = await _lessonRepository.readAll(_profile.organizationId!);

      log('Lessons: $lessons');

      emit(state.copyWith(status: Status.success, lessons: lessons));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: ''));
  }
}
