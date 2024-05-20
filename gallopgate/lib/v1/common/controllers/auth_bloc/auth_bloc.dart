import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/v1/common/domain/models/auth_user.dart';
import 'package:gallopgate/v1/common/domain/use_cases/auth/current_user_use_case.dart';
import 'package:gallopgate/v1/common/domain/use_cases/auth/login_use_case.dart';
import 'package:gallopgate/v1/common/domain/use_cases/auth/logout_use_case.dart';
import 'package:gallopgate/v1/common/domain/use_cases/auth/register_use_case.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final CurrentUserUseCase currentUserUseCase;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc(
    this.currentUserUseCase,
    this.loginUseCase,
    this.registerUseCase,
    this.logoutUseCase,
  ) : super(AuthState.initial()) {
    on<AuthInitial>(_onInitial);
    on<AuthLoginEvent>(_onLoginEvent);
    on<AuthRegisterEvent>(_onRegisterEvent);
    on<AuthLogoutEvent>(_onLogoutEvent);
  }

  FutureOr<void> _onInitial(
    AuthInitial event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    Response<AuthUser> response = await currentUserUseCase(
      const UseCaseParams(),
    );

    if (response is ErrorResponse) {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        user: AuthUser.empty(),
      ));
      return;
    }

    emit(state.copyWith(
      status: AuthStatus.authenticated,
      user: (response as SuccessResponse).data,
    ));
  }

  FutureOr<void> _onLoginEvent(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    Response<AuthUser> response = await loginUseCase(LoginParams(
      event.email,
      event.password,
    ));

    if (response is ErrorResponse) {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        user: AuthUser.empty(),
        error: (response as ErrorResponse).error,
      ));
      return;
    }

    emit(state.copyWith(
      status: AuthStatus.authenticated,
      user: (response as SuccessResponse).data,
    ));
  }

  FutureOr<void> _onRegisterEvent(
    AuthRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    Response<AuthUser> response = await registerUseCase(RegisterParams(
      event.email,
      event.password,
    ));

    if (response is ErrorResponse) {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        user: AuthUser.empty(),
        error: (response as ErrorResponse).error,
      ));
      return;
    }

    emit(state.copyWith(
      status: AuthStatus.authenticated,
      user: (response as SuccessResponse).data,
    ));
  }

  FutureOr<void> _onLogoutEvent(
    AuthLogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));

    logoutUseCase(LogoutParams());

    emit(state.copyWith(
      status: AuthStatus.unauthenticated,
      user: AuthUser.empty(),
    ));
  }
}
