import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/v2/repositories/organization_repository.dart';

part 'org_create_event.dart';
part 'org_create_state.dart';

class OrgCreateBloc extends Bloc<OrgCreateEvent, OrgCreateState> {
  final OrganizationRepository repository;

  OrgCreateBloc(this.repository) : super(OrgCreateState.initial()) {
    on<OrgCreateOnNameChanged>(_onNameChanged);
    on<OrgCreateOnDescriptionChanged>(_onDescriptionChanged);
    on<OrgCreateSubmit>(_onSubmit);
  }

  FutureOr<void> _onNameChanged(
    OrgCreateOnNameChanged event,
    Emitter<OrgCreateState> emit,
  ) async {
    emit(state.copyWith(name: event.name));
  }

  FutureOr<void> _onDescriptionChanged(
    OrgCreateOnDescriptionChanged event,
    Emitter<OrgCreateState> emit,
  ) async {
    emit(state.copyWith(description: event.description));
  }

  FutureOr<void> _onSubmit(
    OrgCreateSubmit event,
    Emitter<OrgCreateState> emit,
  ) async {
    emit(state.copyWith(status: OrgCreateStatus.loading));
    try {
      await repository.create(
        state.name,
        state.description,
      );
      emit(state.copyWith(status: OrgCreateStatus.success));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(status: OrgCreateStatus.error, error: e.toString()));
    }
    emit(state.copyWith(status: OrgCreateStatus.initial, error: ''));
  }
}
