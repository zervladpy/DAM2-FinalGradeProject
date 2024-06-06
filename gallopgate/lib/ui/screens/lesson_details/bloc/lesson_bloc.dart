import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/repositories/lecture_repository.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LectureRepository _lectureRepository;
  final ProfileRepository _profileRepository;

  LessonBloc({
    required LectureRepository lectureRepository,
    required ProfileRepository profileRepository,
  })  : _lectureRepository = lectureRepository,
        _profileRepository = profileRepository,
        super(LessonState.initial()) {
    on<Fetch>(_fetch);
  }

  FutureOr<void> _fetch(
    Fetch event,
    Emitter<LessonState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final lesson = await _lectureRepository.fetch(event.lessonId);
      final creator = await _profileRepository.fetchProfile(lesson!.creatorId);

      emit(state.copyWith(
        status: Status.success,
        lesson: lesson,
        creator: creator,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }
}
