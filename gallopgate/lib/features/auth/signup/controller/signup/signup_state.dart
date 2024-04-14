part of 'signup_cubit.dart';

class SignupState extends Equatable {
  const SignupState._(this.status, this.key, this.email, this.password, this.repeatPassword, this.isPasswordVisible, this.error);

  final GlobalKey<FormState> key;
  final String email, password, repeatPassword, error;
  final bool isPasswordVisible;
  final FetchStatus status;

  factory SignupState.initial() {
    return SignupState._(FetchStatus.initial, GlobalKey() , '', '', '', false, '');
  }

  SignupState copyWith({
    FetchStatus? status,
    String? email,
    String? password,
    String? repeatPassword,
    bool? isPasswordVisible,
    String? error,
  }) {
    return SignupState._(
      status ?? this.status,
      key,
      email ?? this.email,
      password ?? this.password, 
      repeatPassword ?? this.repeatPassword, 
      isPasswordVisible ?? this.isPasswordVisible, 
      error ?? this.error,
    );

  }

  @override
  List<Object> get props => [
    status, email, password, repeatPassword, isPasswordVisible, error,
  ];
}
