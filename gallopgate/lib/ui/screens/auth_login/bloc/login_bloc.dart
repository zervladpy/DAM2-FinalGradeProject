import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/repositories/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginState.initial()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ShowPasswordChanged>(_onShowPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      email: event.email,
    ));
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      password: event.password,
    ));
  }

  void _onShowPasswordChanged(
    ShowPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      showPassword: event.showPassword,
    ));
  }

  void _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await authRepository.login(
        email: state.email,
        password: state.password,
      );

      emit(state.copyWith(status: Status.success));
      return;
    } on AuthException catch (e) {
      emit(state.copyWith(
        status: Status.initial,
        error: e.message.toString(),
      ));
    } catch (e) {
      log(e.toString());
    }

    emit(state.copyWith(status: Status.error));
  }
}
