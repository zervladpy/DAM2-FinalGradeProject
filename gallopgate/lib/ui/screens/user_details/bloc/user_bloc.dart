import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/models/role/role.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ProfileRepository _repository;

  UserBloc({
    required ProfileRepository repository,
  })  : _repository = repository,
        super(UserState.initial()) {
    on<Fetch>(_initialize);
    on<FirstNameChanged>(_firstNameChanged);
    on<LastNameChanged>(_lastNameChanged);
    on<EmailChanged>(_emailChanged);
    on<RoleChanged>(_roleChanged);
    on<BirthDateChanged>(_birthDateChanged);
    on<Update>(_submit);
  }

  FutureOr<void> _initialize(
    Fetch event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final profile = await _repository.fetchProfile(event.id);
      emit(state.copyWith(
        status: Status.success,
        profile: profile,
        initial: profile,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }

  FutureOr<void> _firstNameChanged(
    FirstNameChanged event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(
        profile: state.profile.copyWith(
      firstName: event.firstName,
    )));

    emit(state.copyWith(edited: state.profile != state.initial));
  }

  FutureOr<void> _lastNameChanged(
    LastNameChanged event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(
        profile: state.profile.copyWith(
      lastName: event.lastName,
    )));

    emit(state.copyWith(edited: state.profile != state.initial));
  }

  FutureOr<void> _emailChanged(
    EmailChanged event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(
        profile: state.profile.copyWith(
      email: event.email,
    )));

    emit(state.copyWith(edited: state.profile != state.initial));
  }

  FutureOr<void> _roleChanged(
    RoleChanged event,
    Emitter<UserState> emit,
  ) {
    final profileRoles = state.profile.roles;

    if (profileRoles.contains(event.role)) {
      emit(state.copyWith(
          profile: state.profile.copyWith(
        roles: profileRoles..remove(event.role),
      )));
    } else {
      emit(state.copyWith(
          profile: state.profile.copyWith(
        roles: profileRoles..add(event.role),
      )));
    }
  }

  FutureOr<void> _submit(
    Update event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final profile = await _repository.updateProfile(state.profile);
      emit(state.copyWith(
        status: Status.success,
        profile: profile,
        initial: profile,
        edited: false,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }

  FutureOr<void> _birthDateChanged(
    BirthDateChanged event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
        profile: state.profile.copyWith(
      birthDate: event.birthDate,
    )));

    emit(state.copyWith(edited: state.profile != state.initial));
  }
}
