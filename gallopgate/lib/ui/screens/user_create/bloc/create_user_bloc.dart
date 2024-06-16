import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/models/role/role.dart';
import 'package:gallopgate/repositories/profile_repository.dart';
import 'package:gallopgate/repositories/role_repository.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  final ProfileRepository profileRepository;
  final RoleRepository roleRepository;

  final String organizationId;

  CreateUserBloc({
    required this.organizationId,
    required this.profileRepository,
    required this.roleRepository,
  }) : super(CreateUserState.initial()) {
    on<CreateUserInitialize>(_initialize);
    on<CreateUserFirstNameChanged>(_firstNameChanged);
    on<CreateUserLastNameChanged>(_lastNameChanged);
    on<CreateUserEmailChanged>(_emailChanged);
    on<CreateUserRoleChanged>(_roleChanged);
    on<CreateUserSubmitted>(_submit);
  }

  FutureOr<void> _initialize(
    CreateUserInitialize event,
    Emitter<CreateUserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      var roles = await roleRepository.fetchRoles();

      emit(state.copyWith(
        status: Status.loaded,
        roles: roles,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

  FutureOr<void> _firstNameChanged(
    CreateUserFirstNameChanged event,
    Emitter<CreateUserState> emit,
  ) async {
    emit(state.copyWith(firstName: event.firstName));
  }

  FutureOr<void> _lastNameChanged(
    CreateUserLastNameChanged event,
    Emitter<CreateUserState> emit,
  ) async {
    emit(state.copyWith(lastName: event.lastName));
  }

  FutureOr<void> _emailChanged(
    CreateUserEmailChanged event,
    Emitter<CreateUserState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _roleChanged(
    CreateUserRoleChanged event,
    Emitter<CreateUserState> emit,
  ) {
    var selectedRoles = state.selectedRoles;

    if (selectedRoles.contains(event.role)) {
      selectedRoles = List.from(selectedRoles)..remove(event.role);
    } else {
      selectedRoles = List.from(selectedRoles)..add(event.role);
    }

    emit(state.copyWith(selectedRoles: selectedRoles));
  }

  FutureOr<void> _submit(
    CreateUserSubmitted event,
    Emitter<CreateUserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      Profile profile = Profile(
        id: '',
        avatarUrl: '',
        firstName: state.firstName,
        lastName: state.lastName,
        email: state.email,
        roles: state.selectedRoles,
        organizationId: organizationId,
        createdAt: DateTime.now(),
      );

      await profileRepository.createProfile(profile);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }
}
