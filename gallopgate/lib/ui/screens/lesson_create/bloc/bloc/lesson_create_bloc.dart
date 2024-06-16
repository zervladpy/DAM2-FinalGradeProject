import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/models/lesson_category/lesson_category.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/models/profile/profile_dto.dart';
import 'package:gallopgate/repositories/lesson_category_repository.dart';
import 'package:gallopgate/repositories/lesson_repository.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'lesson_create_event.dart';
part 'lesson_create_state.dart';

class LessonCreateBloc extends Bloc<LessonCreateEvent, LessonCreateState> {
  final LessonRepository _lessonRepository;
  final ProfileRepository _profileRepository;
  final LessonCategoryRepository _lessonCategoryRepository;
  final Organization organization;
  final Profile creator;

  LessonCreateBloc({
    required this.organization,
    required this.creator,
    required LessonRepository lessonRepository,
    required ProfileRepository profileRepository,
    required LessonCategoryRepository lessonCategoryRepository,
  })  : _lessonRepository = lessonRepository,
        _profileRepository = profileRepository,
        _lessonCategoryRepository = lessonCategoryRepository,
        super(LessonCreateState.initial()) {
    on<Fetch>(_fetch);
    on<TitleChanged>(_titleChanged);
    on<CategoryChanged>(_categoryChanged);
    on<CapcaityChanged>(_capacityChanged);
    on<StartAtChanged>(_startAtChanged);
    on<WeekdayChanged>(_weekdayChanged);
    on<DurationChanged>(_durationChanged);
    on<InstructorChanged>(_instructorChanged);
    on<Submit>(_submit);
  }

  FutureOr<void> _fetch(
    Fetch event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final instructors = _profileRepository.fetchInstructors(organization.id!);
      final categories = _lessonCategoryRepository.readAll(organization.id!);

      final result = await Future.wait([instructors, categories]);

      emit(state.copyWith(
        status: Status.loaded,
        instructors: result[0] as List<Profile>,
        categories: result[1] as List<LessonCategory>,
        lesson: state.lesson.copyWith(
          organization: organization,
          creator: ProfileDto(
            id: creator.id,
            firstName: creator.firstName,
            lastName: creator.lastName,
            email: creator.email,
            avatarUrl: creator.avatarUrl,
          ),
        ),
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: ''));
  }

  FutureOr<void> _titleChanged(
    TitleChanged event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(lesson: state.lesson.copyWith(title: event.title)));
  }

  FutureOr<void> _categoryChanged(
    CategoryChanged event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(
        lesson: state.lesson.copyWith(category: event.category)));
  }

  FutureOr<void> _capacityChanged(
    CapcaityChanged event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(
      lesson: state.lesson.copyWith(capacity: event.capacity),
    ));
  }

  FutureOr<void> _startAtChanged(
    StartAtChanged event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(lesson: state.lesson.copyWith(startAt: event.startAt)));
  }

  FutureOr<void> _weekdayChanged(
    WeekdayChanged event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(lesson: state.lesson.copyWith(weekday: event.weekday)));
  }

  FutureOr<void> _durationChanged(
    DurationChanged event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(
      lesson: state.lesson.copyWith(duration: event.duration),
    ));
  }

  FutureOr<void> _submit(
    Submit event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final lesson = await _lessonRepository.create(state.lesson);

      emit(state.copyWith(
          status: Status.success,
          lesson: Lesson(
            id: lesson.id,
            title: lesson.title,
            organization: organization,
            category: state.lesson.category,
            creator: ProfileDto(
              id: creator.id,
              firstName: creator.firstName,
              lastName: creator.lastName,
              email: creator.email,
              avatarUrl: creator.avatarUrl,
            ),
            instructor: state.lesson.instructor,
          )));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: ''));
  }

  FutureOr<void> _instructorChanged(
    InstructorChanged event,
    Emitter<LessonCreateState> emit,
  ) {
    emit(state.copyWith(
        lesson: state.lesson.copyWith(
      instructor: ProfileDto(
        id: event.instructor.id,
        firstName: event.instructor.firstName,
        lastName: event.instructor.lastName,
        email: event.instructor.email,
        avatarUrl: event.instructor.avatarUrl,
      ),
    )));
  }
}
