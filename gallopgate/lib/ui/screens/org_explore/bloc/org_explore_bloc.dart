import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/repositories/organization_repository.dart';

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
    emit(state.copyWith(status: Status.loading));

    try {
      final organizations = await repository.readAll();
      emit(
        state.copyWith(
          status: Status.success,
          items: organizations,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

  FutureOr<void> _onRefresh(
    OrgExploreRefresh event,
    Emitter<OrgExploreState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final organizations = await repository.readAll();
      emit(
        state.copyWith(
          status: Status.success,
          items: organizations,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }
}
