import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/v1/common/domain/models/organization.dart';
import 'package:gallopgate/v1/common/domain/models/user.dart';
import 'package:gallopgate/v1/common/domain/use_cases/organization/fetch_organization_use_case.dart';
import 'package:gallopgate/v1/common/domain/use_cases/user/fetch_user_use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

part 'cache_event.dart';
part 'cache_state.dart';

class CacheBloc extends Bloc<CacheEvent, CacheState> {
  final FetchUserUseCase _fetchUserUseCase;
  final FetchOrganizationUseCase _fetchOrganizationUseCase;

  CacheBloc(
    FetchUserUseCase fetchUserUseCase,
    FetchOrganizationUseCase fetchOrganizationUseCase,
  )   : _fetchUserUseCase = fetchUserUseCase,
        _fetchOrganizationUseCase = fetchOrganizationUseCase,
        super(CacheState.initial()) {
    on<InitializeCacheEvent>(_onInitializeCacheEvent);
    on<UpdateCacheEvent>(_onUpdateCacheEvent);
    on<ClearCacheEvent>(_onClearCacheEvent);
  }

  FutureOr<void> _onInitializeCacheEvent(
    InitializeCacheEvent event,
    Emitter<CacheState> emit,
  ) async {
    emit(state.copyWith(status: CacheStatus.loading));

    final userResponse = await _fetchUserUseCase(
      FetchUserUseCaseParams(id: event.userId),
    );

    log(userResponse.toString());

    if (userResponse is SuccessResponse<User>) {
      final organizationResponse = await _fetchOrganizationUseCase(
        FetchOrganizationUseCaseParams(id: userResponse.data.organizationId),
      );

      if (organizationResponse is ErrorResponse) {
        emit(state.copyWith(
          status: CacheStatus.loaded,
          user: userResponse.data,
          organization: Organization.empty,
        ));
      } else {
        emit(state.copyWith(
          status: CacheStatus.loaded,
          user: userResponse.data,
          organization: (organizationResponse as SuccessResponse).data,
        ));
      }

      return;
    } else {
      log((userResponse as ErrorResponse).error);
      emit(state.copyWith(
        status: CacheStatus.loaded,
        user: User.empty,
        organization: Organization.empty,
      ));
    }
  }

  FutureOr<void> _onUpdateCacheEvent(
    UpdateCacheEvent event,
    Emitter<CacheState> emit,
  ) async {
    emit(state.copyWith(status: CacheStatus.loading));

    final userResponse = await _fetchUserUseCase(
      FetchUserUseCaseParams(id: state.user.id),
    );

    log(userResponse.toString());

    if (userResponse is SuccessResponse<User>) {
      final organizationResponse = await _fetchOrganizationUseCase(
        FetchOrganizationUseCaseParams(id: userResponse.data.organizationId),
      );

      if (organizationResponse is ErrorResponse) {
        emit(state.copyWith(
          status: CacheStatus.loaded,
          user: userResponse.data,
          organization: Organization.empty,
        ));
      } else {
        emit(state.copyWith(
          status: CacheStatus.loaded,
          user: userResponse.data,
          organization: (organizationResponse as SuccessResponse).data,
        ));
      }
    } else {
      emit(state.copyWith(
        status: CacheStatus.loaded,
        user: User.empty,
        organization: Organization.empty,
      ));
    }
  }

  FutureOr<void> _onClearCacheEvent(
    ClearCacheEvent event,
    Emitter<CacheState> emit,
  ) async {
    emit(state.copyWith(
      status: CacheStatus.initial,
      user: User.empty,
      organization: Organization.empty,
    ));
  }
}
