part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState(
    this.email,
    this.emailError,
    this.password,
    this.passwordError,
    this.repeatPassword,
    this.repeatPasswordError,
  );

  final String email,
      emailError,
      password,
      passwordError,
      repeatPassword,
      repeatPasswordError;

  factory RegisterState.initial() {
    return const RegisterState('', '', '', '', '', '');
  }

  RegisterState copyWith({
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
    String? repeatPassword,
    String? repeatPasswordError,
  }) {
    return RegisterState(
      email ?? this.email,
      emailError ?? this.emailError,
      password ?? this.password,
      passwordError ?? this.passwordError,
      repeatPassword ?? this.repeatPassword,
      repeatPasswordError ?? this.repeatPasswordError,
    );
  }

  @override
  List<Object> get props => [
        email,
        emailError,
        password,
        passwordError,
        repeatPassword,
        repeatPasswordError
      ];
}
