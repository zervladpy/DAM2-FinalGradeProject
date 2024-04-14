import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:gallopgate/core/domain/models/model_user.dart';
import 'package:gallopgate/features/auth/signup/domain/usecase/usecase_signup.dart';
import 'package:gallopgate/utils/enums/fetch_state.dart';
import 'package:gallopgate/utils/error/auth/auth_exeption.dart';
import 'package:gallopgate/utils/locator/locator.dart';
import 'package:gallopgate/utils/response/response.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(BuildContext context) : super(SignupState.initial()) {
    usecase = SignupUsecase(GLocator.locator.get());
  }

  late SignupUsecase usecase;

  void onEmailChange(String value) {
    emit(state.copyWith(email: value));
  }

  void onPasswordChange(String value) {
    emit(state.copyWith(password: value));
  }

  void onRepeatPasswordChange(String value) {
    emit(state.copyWith(repeatPassword: value));
  }

  void changePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  bool _validate() {
    return state.key.currentState?.validate() ?? false;
  }

  Future<void> onSignup() async {
    if (!_validate()) {
      return;
    }

    try {
      SignupUsecaseParams params =
          SignupUsecaseParams(state.email, state.password);
      Response<User> response = await usecase(params);

      if (response.data != null) {
        emit(state.copyWith(status: FetchStatus.success, error: ''));
      } else {
        throw AuthSignupException.unkonwn();
      }
    } on AuthSignupException catch (e) {
      emit(state.copyWith(status: FetchStatus.error, error: e.error));
    } finally {
      emit(state.copyWith(status: FetchStatus.initial));
    }
  }
}
