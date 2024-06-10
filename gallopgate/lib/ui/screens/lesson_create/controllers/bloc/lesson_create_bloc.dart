import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/models/lesson_category/lesson_category.dart';
import 'package:gallopgate/models/lesson_member/lesson_member.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/models/role/role.dart';
import 'package:gallopgate/repositories/horse_repository.dart';
import 'package:gallopgate/repositories/lesson_category_repository.dart';
import 'package:gallopgate/repositories/lesson_repository.dart';
import 'package:gallopgate/repositories/profile_repository.dart';
import 'package:gallopgate/repositories/role_repository.dart';

part 'lesson_create_event.dart';
part 'lesson_create_state.dart';

class LessonCreateBloc extends Bloc<LessonCreateEvent, LessonCreateState> {
  final LessonRepository _lessonRepository; // ignore: unused_field
  final LessonCategoryRepository _lessonCategoryRepository;
  final ProfileRepository _profileRepository;
  final HorseRepository _horseRepository;
  final RoleRepository _roleRepository;

  LessonCreateBloc({
    required LessonRepository lessonRepository,
    required LessonCategoryRepository lessonCategoryRepository,
    required ProfileRepository profileRepository,
    required HorseRepository horseRepository,
    required RoleRepository roleRepository,
  })  : _lessonRepository = lessonRepository,
        _lessonCategoryRepository = lessonCategoryRepository,
        _profileRepository = profileRepository,
        _horseRepository = horseRepository,
        _roleRepository = roleRepository,
        super(LessonCreateState.initial()) {
    on<Fetch>(_fetch);
    on<TitleChanged>(_titleChanged);
    on<CategoryChanged>(_categoryChanged);
    on<CapacityChanged>(_capacityChanged);
    on<StartAtChanged>(_startAtChanged);
    on<WeekDayChanged>(_weekDayChanged);
    on<MemberChanged>(_memberChanged);
    on<AddLessonMemeber>(_addLessonMemeber);
    on<RemoveLessonMemeber>(_removeLessonMemeber);
  }

  FutureOr<void> _fetch(
    Fetch event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final categories =
          _lessonCategoryRepository.readAll(event.organizationId);
      final profiles = _profileRepository.fetchProfiles(event.organizationId);
      final horses =
          _horseRepository.readAllByOrganization(event.organizationId);
      final roles = _roleRepository.fetchRoles();

      final response = await Future.wait([
        categories,
        profiles,
        horses,
        roles,
      ]);

      log('Categories: ${response[0]}');
      log('Profiles: ${response[1]}');
      log('Horses: ${response[2]}');
      log('Roles: ${response[3]}');

      emit(state.copyWith(
        status: Status.loaded,
        categories: response[0] as List<LessonCategory>,
        profiles: response[1] as List<Profile>,
        horses: response[2] as List<Horse>,
        roles: response[3] as List<Role>,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }

  FutureOr<void> _titleChanged(
    TitleChanged event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(
      lesson: state.lesson.copyWith(title: event.title),
    ));
  }

  FutureOr<void> _categoryChanged(
    CategoryChanged event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(
      lesson: state.lesson.copyWith(category: event.category),
    ));
  }

  FutureOr<void> _capacityChanged(
    CapacityChanged event,
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
    emit(state.copyWith(
      lesson: state.lesson.copyWith(startAt: event.startAt),
    ));
  }

  FutureOr<void> _weekDayChanged(
    WeekDayChanged event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(
      lesson: state.lesson.copyWith(weekday: event.weekDay),
    ));
  }

  FutureOr<void> _memberChanged(
    MemberChanged event,
    Emitter<LessonCreateState> emit,
  ) async {
    final members = state.members;
    members[event.index] = event.member;
    emit(state.copyWith(members: members));
  }

  FutureOr<void> _addLessonMemeber(
    AddLessonMemeber event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(
      members: [
        ...state.members,
        LessonMember.empty,
      ],
    ));
  }

  FutureOr<void> _removeLessonMemeber(
    RemoveLessonMemeber event,
    Emitter<LessonCreateState> emit,
  ) async {
    emit(state.copyWith(
      members: [
        ...state.members..removeAt(event.index),
      ],
    ));
  }
}
