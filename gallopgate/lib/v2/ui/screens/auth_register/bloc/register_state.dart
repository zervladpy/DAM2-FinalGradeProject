part of 'register_bloc.dart';

enum RegisterStatus { initial, loading, success, error }

class RegisterState extends Equatable {
  const RegisterState._({
    required this.status,
    required this.name,
    required this.email,
    required this.password,
    required this.repeatPassword,
    required this.showPassword,
    required this.acceptTerms,
    required this.nameError,
    required this.emailError,
    required this.passwordError,
    required this.repeatPasswordError,
    required this.acceptTermsError,
    required this.error,
  });

  final RegisterStatus status;
  final String name, email, password, repeatPassword;
  final bool showPassword, acceptTerms;
  final String nameError,
      emailError,
      passwordError,
      repeatPasswordError,
      acceptTermsError,
      error;

  factory RegisterState.initial() => const RegisterState._(
        status: RegisterStatus.initial,
        name: '',
        email: '',
        password: '',
        repeatPassword: '',
        showPassword: false,
        acceptTerms: false,
        nameError: '',
        emailError: '',
        passwordError: '',
        repeatPasswordError: '',
        acceptTermsError: '',
        error: '',
      );

  RegisterState copyWith({
    RegisterStatus? status,
    String? name,
    String? email,
    String? password,
    String? repeatPassword,
    bool? showPassword,
    bool? acceptTerms,
    String? nameError,
    String? emailError,
    String? passwordError,
    String? repeatPasswordError,
    String? acceptTermsError,
    String? error,
  }) {
    return RegisterState._(
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      repeatPassword: repeatPassword ?? this.repeatPassword,
      showPassword: showPassword ?? this.showPassword,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      nameError: nameError ?? this.nameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      repeatPasswordError: repeatPasswordError ?? this.repeatPasswordError,
      acceptTermsError: acceptTermsError ?? this.acceptTermsError,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        status,
        name,
        email,
        password,
        repeatPassword,
        showPassword,
        acceptTerms,
        nameError,
        emailError,
        passwordError,
        repeatPasswordError,
        acceptTermsError,
        error,
      ];
}
