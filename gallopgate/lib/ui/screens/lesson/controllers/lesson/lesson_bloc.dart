import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/models/lesson_category/lesson_category.dart';
import 'package:gallopgate/models/lesson_member/lesson_member.dart';
import 'package:gallopgate/models/profile/profile_dto.dart';
import 'package:gallopgate/repositories/horse_repository.dart';
import 'package:gallopgate/repositories/lesson_category_repository.dart';
import 'package:gallopgate/repositories/lesson_members_repository.dart';
import 'package:gallopgate/repositories/lesson_repository.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

import '../../../../../models/profile/profile.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonRepository _lessonRepository;
  final LessonCategoryRepository _lessonCategoryRepository;
  final ProfileRepository _profileRepository;
  final HorseRepository _horseRepository;
  final LessonMembersRepository _lessonMembersRepository;

  LessonBloc({
    required LessonRepository lessonRepository,
    required LessonCategoryRepository lessonCategoryRepository,
    required ProfileRepository profileRepository,
    required HorseRepository horseRepository,
    required LessonMembersRepository lessonMembersRepository,
  })  : _lessonRepository = lessonRepository,
        _lessonCategoryRepository = lessonCategoryRepository,
        _profileRepository = profileRepository,
        _horseRepository = horseRepository,
        _lessonMembersRepository = lessonMembersRepository,
        super(LessonState.initial()) {
    on<Fetch>(_fetch);
    on<TitleChanged>(_titleChanged);
    on<CategoryChanged>(_categoryChanged);
    on<InstructorChanged>(_instructorChanged);
    on<StartAtChanged>(_startAtChanged);
    on<DurationChanged>(_durationChanged);
    on<WeekdayChanged>(_weekdayChanged);
    on<CapacityChanged>(_capacityChanged);
    on<AddMember>(_addMember);
    on<RemoveMember>(_removeMember);
    on<UpdateMember>(_updateMember);
    on<Update>(_update);
    on<Delete>(_delete);
  }

  FutureOr<void> _fetch(
    Fetch event,
    Emitter<LessonState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final futures = <Future>[
        _lessonRepository.read(event.id),
        _lessonCategoryRepository.readAll(event.organizationId),
        _profileRepository.fetchInstructors(event.organizationId),
        _profileRepository.fetchRiders(event.organizationId),
        _horseRepository.readAllByOrganization(event.organizationId),
      ];

      final results = await Future.wait(futures);

      emit(state.copyWith(
        status: Status.loaded,
        lesson: results[0] as Lesson,
        categories: results[1] as List<LessonCategory>,
        instructors: results[2] as List<Profile>,
        riders: results[3] as List<Profile>,
        horses: results[4] as List<Horse>,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: ''));
  }

  FutureOr<void> _titleChanged(
    TitleChanged event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(lesson: state.lesson.copyWith(title: event.value)));
  }

  FutureOr<void> _categoryChanged(
    CategoryChanged event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(lesson: state.lesson.copyWith(category: event.value)));
  }

  FutureOr<void> _instructorChanged(
    InstructorChanged event,
    Emitter<LessonState> emit,
  ) {
    final profile = ProfileDto(
      id: event.value.id,
      firstName: event.value.firstName,
      lastName: event.value.lastName,
      email: event.value.email,
      avatarUrl: event.value.avatarUrl,
    );

    emit(
      state.copyWith(lesson: state.lesson.copyWith(instructor: profile)),
    );
  }

  FutureOr<void> _startAtChanged(
    StartAtChanged event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(lesson: state.lesson.copyWith(startAt: event.value)));
  }

  FutureOr<void> _durationChanged(
    DurationChanged event,
    Emitter<LessonState> emit,
  ) {
    final duration = event.value.hour * 60 + event.value.minute;

    emit(state.copyWith(lesson: state.lesson.copyWith(duration: duration)));
  }

  FutureOr<void> _weekdayChanged(
    WeekdayChanged event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(lesson: state.lesson.copyWith(weekday: event.value)));
  }

  FutureOr<void> _capacityChanged(
    CapacityChanged event,
    Emitter<LessonState> emit,
  ) {
    emit(state.copyWith(lesson: state.lesson.copyWith(capacity: event.value)));
  }

  FutureOr<void> _addMember(
    AddMember event,
    Emitter<LessonState> emit,
  ) async {
    final members = List<LessonMember>.from(
      state.lesson.lessonMembers,
    );

    try {
      await _lessonMembersRepository.create(event.value);
      members.add(event.value);
      emit(state.copyWith(
        lesson: state.lesson.copyWith(lessonMembers: members),
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(lesson: state.lesson.copyWith(lessonMembers: members)));
  }

  FutureOr<void> _removeMember(
    RemoveMember event,
    Emitter<LessonState> emit,
  ) async {
    final members = List<LessonMember>.from(
      state.lesson.lessonMembers,
    )..remove(event.value);

    try {
      await _lessonMembersRepository.delete(event.value.id!);
      emit(state.copyWith(
        lesson: state.lesson.copyWith(lessonMembers: members),
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }
  }

  FutureOr<void> _update(
    Update event,
    Emitter<LessonState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await _lessonRepository.update(state.lesson);
      emit(state.copyWith(status: Status.loaded));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: ''));
  }

  FutureOr<void> _delete(
    Delete event,
    Emitter<LessonState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await _lessonRepository.delete(state.lesson.id);
      emit(state.copyWith(status: Status.loaded));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: ''));
  }

  FutureOr<void> _updateMember(
    UpdateMember event,
    Emitter<LessonState> emit,
  ) async {
    final members = List<LessonMember>.from(state.lesson.lessonMembers);
    final index = members.indexWhere((m) => m.id == event.value.id);

    members[index] = event.value;

    try {
      await _lessonMembersRepository.update(event.value);
      emit(state.copyWith(
        lesson: state.lesson.copyWith(lessonMembers: members),
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }
  }
}
