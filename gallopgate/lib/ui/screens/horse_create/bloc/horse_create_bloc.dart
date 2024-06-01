import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/repositories/horse_repository.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'horse_create_event.dart';
part 'horse_create_state.dart';

class HorseCreateBloc extends Bloc<HorseCreateEvent, HorseCreateState> {
  final String organizationId;
  final HorseRepository horseRepository;
  final ProfileRepository profileRepository;

  HorseCreateBloc({
    required this.horseRepository,
    required this.profileRepository,
    required this.organizationId,
  }) : super(HorseCreateState.initial()) {
    on<HorseCreateInitialize>(_initialize);
    on<HorseCreateNameChanged>(_nameChanged);
    on<HorseCreateAliasChanged>(_aliasChanged);
    on<HorseCreateOwnerIdChanged>(_ownerIdChanged);
    on<HorseCreateBirthDateChanged>(_birthDateChanged);
    on<HorseCreateSubmitt>(_submitt);
  }

  Future<void> _initialize(
    HorseCreateInitialize event,
    Emitter<HorseCreateState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final profiles = await profileRepository.fetchAllProfiles(organizationId);
      emit(state.copyWith(
        status: Status.initial,
        profiles: profiles,
        horse: state.horse.copyWith(
          organizationId: organizationId,
        ),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        error: e.toString(),
      ));
    }
  }

  FutureOr<void> _nameChanged(
    HorseCreateNameChanged event,
    Emitter<HorseCreateState> emit,
  ) async {
    emit(state.copyWith(horse: state.horse.copyWith(fullName: event.value)));
  }

  FutureOr<void> _aliasChanged(
    HorseCreateAliasChanged event,
    Emitter<HorseCreateState> emit,
  ) async {
    emit(state.copyWith(horse: state.horse.copyWith(alias: event.value)));
  }

  FutureOr<void> _ownerIdChanged(
    HorseCreateOwnerIdChanged event,
    Emitter<HorseCreateState> emit,
  ) async {
    emit(state.copyWith(horse: state.horse.copyWith(ownerId: event.value)));
  }

  FutureOr<void> _birthDateChanged(
    HorseCreateBirthDateChanged event,
    Emitter<HorseCreateState> emit,
  ) async {
    emit(state.copyWith(horse: state.horse.copyWith(birthDate: event.value)));
  }

  FutureOr<void> _submitt(
    HorseCreateSubmitt event,
    Emitter<HorseCreateState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await horseRepository.create(state.horse);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        error: e.toString(),
      ));
    }

    emit(state.copyWith(status: Status.initial));
  }
}
