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
    on<UserDetailFirstNameChangedEvent>(_firstNameChanged);
    on<UserDetailLastNameChangedEvent>(_lastNameChanged);
    on<UserDetailEmailChangedEvent>(_emailChanged);
    on<UserDetailRoleChangedEvent>(_roleChanged);
    on<UserDetailSubmittedEvent>(_submit);
  }

  FutureOr<void> _initialize(
    Fetch event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final profile = await _repository.fetchProfile(event.id);
      emit(state.copyWith(status: Status.success, profile: profile));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }
  }

  FutureOr<void> _firstNameChanged(
    UserDetailFirstNameChangedEvent event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(
        profile: state.profile.copyWith(
      firstName: event.firstName,
    )));
  }

  FutureOr<void> _lastNameChanged(
    UserDetailLastNameChangedEvent event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(
        profile: state.profile.copyWith(
      lastName: event.lastName,
    )));
  }

  FutureOr<void> _emailChanged(
    UserDetailEmailChangedEvent event,
    Emitter<UserState> emit,
  ) {
    emit(state.copyWith(
        profile: state.profile.copyWith(
      email: event.email,
    )));
  }

  FutureOr<void> _roleChanged(
    UserDetailRoleChangedEvent event,
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
    UserDetailSubmittedEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await _repository.updateProfile(state.profile);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }
  }
}
