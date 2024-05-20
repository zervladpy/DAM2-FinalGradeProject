import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/v2/repositories/organization_repository.dart';
import 'package:gallopgate/v2/ui/screens/org_explore/models/explore_organizations_dto.dart';

part 'org_explore_event.dart';
part 'org_explore_state.dart';

class OrgExploreBloc extends Bloc<OrgExploreEvent, OrgExploreState> {
  final OrganizationRepository repository;

  OrgExploreBloc(this.repository) : super(OrgExploreState.initial()) {
    on<OrgExploreFetch>(_onFetch);
    on<OrgExploreRefresh>(_onRefresh);
  }

  FutureOr<void> _onFetch(
    OrgExploreFetch event,
    Emitter<OrgExploreState> emit,
  ) async {
    emit(state.copyWith(status: OrgExploreStatus.loading));

    try {
      final organizations = await repository.fetchAll();
      emit(
        state.copyWith(
          status: OrgExploreStatus.success,
          items: organizations,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: OrgExploreStatus.error));
    }
  }

  FutureOr<void> _onRefresh(
    OrgExploreRefresh event,
    Emitter<OrgExploreState> emit,
  ) async {
    emit(state.copyWith(status: OrgExploreStatus.loading));

    try {
      final organizations = await repository.fetchAll();
      emit(
        state.copyWith(
          status: OrgExploreStatus.success,
          items: organizations,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: OrgExploreStatus.error));
    }
  }
}

extension on OrganizationRepository {
  Future<List<ExploreOrganizationDto>> fetchAll() async {
    return query.select('id, name, description').withConverter((recods) {
      return recods
          .map((record) => ExploreOrganizationDto.fromJson(record))
          .toList();
    });
  }
}
