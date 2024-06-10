import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/repositories/horse_repository.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'horse_event.dart';
part 'horse_state.dart';

class HorseBloc extends Bloc<HorseEvent, HorseState> {
  final HorseRepository _horseRepository;
  final ProfileRepository _profileRepository;

  HorseBloc({
    required HorseRepository horseRepository,
    required ProfileRepository profileRepository,
  })  : _horseRepository = horseRepository,
        _profileRepository = profileRepository,
        super(HorseState.initial()) {
    on<Fetch>(_fetch);
    on<NameChanged>(_nameChanged);
    on<AliasChanged>(_aliasChanged);
    on<OwnerChanged>(_ownerChanged);
    on<Update>(_update);
  }

  FutureOr<void> _fetch(
    Fetch event,
    Emitter<HorseState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final horse = await _horseRepository.read(event.id);
      final profiles =
          await _profileRepository.fetchProfiles(event.organizationId);
      final owner = profiles.firstWhere(
        (profile) => profile.id == horse!.ownerId,
      );

      emit(state.copyWith(
        status: Status.loaded,
        horse: horse,
        initial: horse,
        owner: owner,
        profiles: profiles,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }

  FutureOr<void> _nameChanged(
    NameChanged event,
    Emitter<HorseState> emit,
  ) async {
    emit(state.copyWith(
      horse: state.horse.copyWith(fullName: event.name),
    ));
    emit(state.copyWith(edited: state.initial != state.horse));
  }

  FutureOr<void> _aliasChanged(
    AliasChanged event,
    Emitter<HorseState> emit,
  ) async {
    emit(state.copyWith(
      horse: state.horse.copyWith(alias: event.alias),
    ));
    emit(state.copyWith(edited: state.initial != state.horse));
  }

  FutureOr<void> _ownerChanged(
    OwnerChanged event,
    Emitter<HorseState> emit,
  ) async {
    Profile? owner;

    if (event.ownerId != null) {
      owner = state.profiles.firstWhere(
        (profile) => profile.id == event.ownerId,
      );
    }

    emit(state.copyWith(
      horse: state.horse.copyWith(ownerId: owner?.id),
      owner: owner,
    ));
    emit(state.copyWith(
      edited: state.initial != state.horse,
    ));
  }

  FutureOr<void> _update(
    Update event,
    Emitter<HorseState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await _horseRepository.update(state.horse);
      emit(state.copyWith(status: Status.success, initial: state.horse));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }
}
