part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState._({
    this.status = Status.initial,
    this.email = '',
    this.password = '',
    this.repeatPassword = '',
    this.showPassword = true,
    this.acceptTerms = false,
    this.error,
  });

  final Status status;
  final String email, password, repeatPassword;
  final bool showPassword, acceptTerms;
  final String? error;

  factory RegisterState.initial() => const RegisterState._();

  RegisterState copyWith({
    Status? status,
    String? name,
    String? email,
    String? password,
    String? repeatPassword,
    bool? showPassword,
    bool? acceptTerms,
    String? error,
  }) {
    return RegisterState._(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      repeatPassword: repeatPassword ?? this.repeatPassword,
      showPassword: showPassword ?? this.showPassword,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        repeatPassword,
        showPassword,
        acceptTerms,
        error,
      ];
}
