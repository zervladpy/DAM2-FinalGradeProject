import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'user_edit_event.dart';
part 'user_edit_state.dart';

class UserEditBloc extends Bloc<UserEditEvent, UserEditState> {
  final ProfileRepository repository;

  UserEditBloc(this.repository) : super(UserEditState.initial()) {
    on<UserEditFetch>(_fetch);
    on<UserEditFirstNameChanged>(_firstNameChanged);
    on<UserEditLastNameChanged>(_lastNameChanged);
    on<UserEditUpdateSubmit>(_submit);
  }

  FutureOr<void> _fetch(
    UserEditFetch event,
    Emitter<UserEditState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final profile = await repository.fetchProfile(event.profileId);
      emit(state.copyWith(
        status: Status.loaded,
        profile: profile,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }

  FutureOr<void> _firstNameChanged(
    UserEditFirstNameChanged event,
    Emitter<UserEditState> emit,
  ) async {
    emit(state.copyWith(
      profile: state.profile.copyWith(firstName: event.firstName),
    ));
  }

  FutureOr<void> _lastNameChanged(
    UserEditLastNameChanged event,
    Emitter<UserEditState> emit,
  ) {
    emit(state.copyWith(
      profile: state.profile.copyWith(lastName: event.lastName),
    ));
  }

  FutureOr<void> _submit(
    UserEditUpdateSubmit event,
    Emitter<UserEditState> emit,
  ) {
    emit(state.copyWith(status: Status.loading));

    try {
      repository.updateProfile(state.profile);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }
}
