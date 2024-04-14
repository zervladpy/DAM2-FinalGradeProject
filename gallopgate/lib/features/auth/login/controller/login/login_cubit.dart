import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/core/domain/models/model_user.dart';
import 'package:gallopgate/features/auth/login/domain/usecase/usecase_login.dart';
import 'package:gallopgate/utils/enums/fetch_state.dart';
import 'package:gallopgate/utils/error/auth/auth_exeption.dart';
import 'package:gallopgate/utils/locator/locator.dart';
import 'package:gallopgate/utils/response/response.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.onLoginSuccess) : super(LoginState.initial()) {
    useCase = LoginUsecase(GLocator.locator.get());
  }

  final void Function() onLoginSuccess;
  late LoginUsecase useCase;

  /// Whenever email is changed
  void onEmailChange(String value) {
    emit(state.copyWith(email: value));
  }

  /// Whenever password is changed
  void onPasswordChange(String value) {
    emit(state.copyWith(password: value));
  }

  /// Whenever change password visibility is triggered
  void onChangeVisibility() {
    emit(state.copyWith(passwordVisible: !state.passwordVisible));
  }

  bool _validate() {
    return state.key.currentState?.validate() ?? false;
  }

  /// When login button is triggered
  Future<void> onLogin() async {
    if (!_validate()) {
      return;
    }

    log('${state.email} ${state.password}');

    emit(state.copyWith(status: FetchStatus.loading));

    try {
      LoginUsecaseParams params =
          LoginUsecaseParams(state.email, state.password);
      Response<User> response = await useCase(params);

      if (response.error != null) {
        emit(state.copyWith(status: FetchStatus.error, error: response.error));
        return;
      }

      if (response.data == null) {
        throw AuthLoginException.unkonwn();
      }

      emit(state.copyWith(status: FetchStatus.success, error: ''));
      // --- Login Succeeded -- //
      onLoginSuccess();
    } on AuthLoginException catch (e) {
      emit(state.copyWith(status: FetchStatus.error, error: e.error));
    } finally {
      emit(state.copyWith(status: FetchStatus.initial));
    }
  }
}
