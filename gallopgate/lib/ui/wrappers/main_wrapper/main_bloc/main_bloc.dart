import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/repositories/lecture_repository.dart';
import 'package:gallopgate/repositories/organization_repository.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final ProfileRepository profileRepository;
  final OrganizationRepository organizationRepository;
  final LectureRepository lectureRepository;

  MainBloc({
    required this.profileRepository,
    required this.organizationRepository,
    required this.lectureRepository,
  }) : super(MainState.initial()) {
    on<MainEventInitialize>(_onInitialize);
  }

  FutureOr<void> _onInitialize(
    MainEventInitialize event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(status: MainStatus.loading));

    try {
      final Profile? profile = await profileRepository.fetchProfile(
        event.profileId,
      );

      if (profile == null) throw Exception('Profile not found');

      if (profile.organizationId == null) throw Exception('No Organization');

      final Organization? organization = await organizationRepository.fetch(
        profile.organizationId!,
      );

      if (organization == null) throw Exception('Organization not found');

      emit(state.copyWith(
        status: MainStatus.success,
        profile: profile,
        organization: organization,
      ));
    } catch (e) {
      emit(state.copyWith(status: MainStatus.failure));
    }
  }
}
