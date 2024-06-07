import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/repositories/organization_repository.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'organization_event.dart';
part 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  final OrganizationRepository _organizationRepository;
  final ProfileRepository _profileRepository;

  OrganizationBloc({
    required OrganizationRepository organizationRepository,
    required ProfileRepository profileRepository,
  })  : _organizationRepository = organizationRepository,
        _profileRepository = profileRepository,
        super(OrganizationState.initial()) {
    on<Fetch>(_fetch);
    on<LogoChanged>(_logoChanged);
    on<DescriptionChanged>(_descriptionChanged);
    on<NameChanged>(_nameChanged);
  }

  FutureOr<void> _fetch(
    Fetch event,
    Emitter<OrganizationState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final organization = await _organizationRepository.fetch(event.id);
      final creator =
          await _profileRepository.fetchProfile(organization!.creatorId);

      emit(state.copyWith(
        status: Status.success,
        initial: organization,
        organization: organization,
        creator: creator,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }

  FutureOr<void> _logoChanged(
    LogoChanged event,
    Emitter<OrganizationState> emit,
  ) {}

  FutureOr<void> _descriptionChanged(
    DescriptionChanged event,
    Emitter<OrganizationState> emit,
  ) async {
    emit(state.copyWith(
      organization: state.organization.copyWith(description: event.description),
    ));
    emit(state.copyWith(
      edited: state.initial != state.organization,
    ));
  }

  FutureOr<void> _nameChanged(
    NameChanged event,
    Emitter<OrganizationState> emit,
  ) async {
    emit(state.copyWith(
      organization: state.organization.copyWith(name: event.name),
    ));
    emit(state.copyWith(
      edited: state.initial != state.organization,
    ));
  }
}
