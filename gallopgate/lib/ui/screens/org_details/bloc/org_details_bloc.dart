import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/repositories/organization_repository.dart';
import 'package:gallopgate/ui/screens/org_details/models/creator_dto.dart';
import 'package:gallopgate/ui/screens/org_details/models/org_details_dto.dart';

part 'org_details_event.dart';
part 'org_details_state.dart';

class OrgDetailsBloc extends Bloc<OrgDetailsEvent, OrgDetailsState> {
  final OrganizationRepository repository;

  OrgDetailsBloc(
    this.repository,
  ) : super(OrgDetailsState.initial()) {
    on<OrgDetailsFetch>(_onFetch);
  }

  FutureOr<void> _onFetch(
    OrgDetailsFetch event,
    Emitter<OrgDetailsState> emit,
  ) async {
    emit(state.copyWith(status: OrgDetailsStatus.loading));
    var response = await repository.fetchOrgDetails(event.organizationId);

    if (response != null) {
      emit(state.copyWith(status: OrgDetailsStatus.success, item: response));
    } else {
      emit(state.copyWith(status: OrgDetailsStatus.error));
    }
  }
}

extension on OrganizationRepository {
  Future<OrgDetailsDto?> fetchOrgDetails(String organizationId) async {
    var response = await query
        .select(
            'id, name, description, logo_url, profiles!profiles_organization_id_fkey (id, first_name)')
        .eq('id', organizationId)
        .maybeSingle()
        .withConverter((row) {
      if (row == null) return null;

      return OrgDetailsDto(
        id: row['id'] ?? "",
        name: row['name'] ?? "",
        description: row['description'] ?? "",
        creator: CreatorDto(
          name: row['profiles'][0]['first_name'] ?? "",
        ),
      );
    });

    return response;
  }
}
