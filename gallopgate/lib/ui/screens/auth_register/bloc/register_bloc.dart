import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc(
    this.authRepository,
  ) : super(RegisterState.initial()) {
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterRepeatPasswordChanged>(_onRepeatPasswordChanged);
    on<RegisterAcceptTermsChanged>(_onAcceptTermsChanged);
    on<RegisterShowPasswordChanged>(_onShowPasswordChanged);
    on<RegisterSubmitted>(_onSubmitted);
  }

  void _onNameChanged(
    RegisterNameChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      name: event.name,
    ));
  }

  void _onEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  void _onRepeatPasswordChanged(
    RegisterRepeatPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      repeatPassword: event.repeatPassword,
    ));
  }

  void _onAcceptTermsChanged(
    RegisterAcceptTermsChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      acceptTerms: event.acceptTerms,
    ));
  }

  void _onShowPasswordChanged(
    RegisterShowPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      showPassword: event.showPassword,
    ));
  }

  FutureOr<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(
      status: Status.loading,
    ));

    try {
      final profile = await authRepository.createAccount(
        email: state.email,
        password: state.password,
      );

      if (profile != null) {
        emit(state.copyWith(
          status: Status.success,
        ));
      } else {
        emit(state.copyWith(
          status: Status.error,
          error: 'Failed to create account',
        ));
      }
    } on AuthException catch (e) {
      emit(state.copyWith(
        status: Status.error,
        error: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: Status.error,
        error: 'An unknown error occurred',
      ));
    }
  }
}
