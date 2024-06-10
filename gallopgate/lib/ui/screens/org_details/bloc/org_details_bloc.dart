import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/repositories/organization_repository.dart';

part 'org_details_event.dart';
part 'org_details_state.dart';

class OrgDetailsBloc extends Bloc<OrgDetailsEvent, OrgDetailsState> {
  final OrganizationRepository _organizationRepository;

  OrgDetailsBloc({
    required OrganizationRepository organizationRepository,
  })  : _organizationRepository = organizationRepository,
        super(OrgDetailsState.initial()) {
    on<OrgDetailsFetch>(_onFetch);
  }

  FutureOr<void> _onFetch(
    OrgDetailsFetch event,
    Emitter<OrgDetailsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    var organization = await _organizationRepository.read(event.organizationId);
    if (organization != null) {
      emit(state.copyWith(status: Status.success, item: organization));
    } else {
      emit(state.copyWith(status: Status.error));
    }
  }
}
