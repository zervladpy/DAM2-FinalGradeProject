part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  const LoginState._({
    required this.status,
    required this.email,
    required this.password,
    required this.emailError,
    required this.passwordError,
    required this.error,
    required this.showPassword,
  });

  final LoginStatus status;
  final String email, password;
  final String emailError, passwordError, error;
  final bool showPassword;

  factory LoginState.initial() => const LoginState._(
        status: LoginStatus.initial,
        email: '',
        password: '',
        emailError: '',
        passwordError: '',
        error: '',
        showPassword: false,
      );

  LoginState copyWith({
    LoginStatus? status,
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    String? error,
    bool? showPassword,
  }) {
    return LoginState._(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      error: error ?? this.error,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object> get props => [
        status,
        email,
        password,
        emailError,
        passwordError,
        error,
        showPassword,
      ];
}
