import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/models/role/role.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final ProfileRepository repository;

  UserDetailsBloc(
    this.repository,
  ) : super(UserDetailsState.initial()) {
    on<UserDetailsInitialize>(_initialize);
    on<UserDetailFirstNameChangedEvent>(_firstNameChanged);
    on<UserDetailLastNameChangedEvent>(_lastNameChanged);
    on<UserDetailEmailChangedEvent>(_emailChanged);
    on<UserDetailRoleChangedEvent>(_roleChanged);
    on<UserDetailSubmittedEvent>(_submit);
  }

  FutureOr<void> _initialize(
    UserDetailsInitialize event,
    Emitter<UserDetailsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final profile = await repository.fetchProfile(event.profileId);
      emit(state.copyWith(status: Status.success, profile: profile));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }
  }

  FutureOr<void> _firstNameChanged(
    UserDetailFirstNameChangedEvent event,
    Emitter<UserDetailsState> emit,
  ) {
    emit(state.copyWith(
        profile: state.profile.copyWith(
      firstName: event.firstName,
    )));
  }

  FutureOr<void> _lastNameChanged(
    UserDetailLastNameChangedEvent event,
    Emitter<UserDetailsState> emit,
  ) {
    emit(state.copyWith(
        profile: state.profile.copyWith(
      lastName: event.lastName,
    )));
  }

  FutureOr<void> _emailChanged(
    UserDetailEmailChangedEvent event,
    Emitter<UserDetailsState> emit,
  ) {
    emit(state.copyWith(
        profile: state.profile.copyWith(
      email: event.email,
    )));
  }

  FutureOr<void> _roleChanged(
    UserDetailRoleChangedEvent event,
    Emitter<UserDetailsState> emit,
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
    Emitter<UserDetailsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await repository.updateProfile(state.profile);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }
  }
}
