import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'profiles_event.dart';
part 'profiles_state.dart';

class ProfilesBloc extends Bloc<ProfilesEvent, ProfilesState> {
  final ProfileRepository _profileRepository;
  final String id;

  ProfilesBloc({
    required ProfileRepository repository,
    required this.id,
  })  : _profileRepository = repository,
        super(ProfilesState.initial()) {
    on<Fetch>(_fetch);
  }

  FutureOr<void> _fetch(Fetch event, Emitter<ProfilesState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final profiles = await _profileRepository.fetchProfiles(id);

      emit(state.copyWith(
        status: Status.success,
        profiles: profiles,
        filtered: profiles,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }
}
