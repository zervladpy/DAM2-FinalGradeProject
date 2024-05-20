import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/v1/common/domain/models/organization.dart';
import 'package:gallopgate/v1/common/domain/use_cases/organization/fetch_organizations_usecase.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

part 'join_organization_event.dart';
part 'join_organization_state.dart';

class JoinOrganizationBloc
    extends Bloc<JoinOrganizationEvent, JoinOrganizationState> {
  final FetchOrgaizationsUsecase fetchUsecase;

  JoinOrganizationBloc(
    this.fetchUsecase,
  ) : super(const JoinOrganizationState.initial()) {
    on<JoinOrganizationInitialize>(_onInitialize);
  }

  FutureOr<void> _onInitialize(
    JoinOrganizationInitialize event,
    Emitter<JoinOrganizationState> emit,
  ) async {
    emit(state.copyWith(status: JoinOrganizationStatus.loading));

    Response response = await fetchUsecase(FetchManyParams());

    log(response.toString());

    if (response is SuccessResponse) {
      emit(state.copyWith(
        status: JoinOrganizationStatus.loaded,
        items: response.data,
      ));
    } else {
      log((response as ErrorResponse).error);
      emit(state.copyWith(status: JoinOrganizationStatus.error));
    }
  }
}
