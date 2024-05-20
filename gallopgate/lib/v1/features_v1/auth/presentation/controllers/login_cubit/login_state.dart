part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState._(
    this.email,
    this.emailError,
    this.password,
    this.passwordError,
  );

  final String email, emailError, password, passwordError;

  factory LoginState.initial() => const LoginState._("", "", "", "");

  LoginState copyWith({
    String? email,
    String? emailError,
    String? password,
    String? passwordError,
  }) =>
      LoginState._(
        email ?? this.email,
        emailError ?? this.emailError,
        password ?? this.password,
        passwordError ?? this.passwordError,
      );

  @override
  List<Object> get props => [email, emailError, password, passwordError];
}
