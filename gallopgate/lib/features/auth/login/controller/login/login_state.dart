part of 'login_cubit.dart';

/// State for [LoginScreen]
class LoginState extends Equatable {
  const LoginState._(this.status, this.key, this.email, this.password, this.passwordVisible, this.error);

  final FetchStatus status; 
  final GlobalKey<FormState> key;
  final String email, password, error;
  final bool passwordVisible;

  /// Empty initial factory
  factory LoginState.initial() => LoginState._(FetchStatus.initial, GlobalKey(), '', '', false, '');

  /// Whenever is a new state is emitted, should be called the copyWith method
  LoginState copyWith({
    FetchStatus? status, String? email, String? password, bool? passwordVisible, String? error,
  }) {
    return LoginState._(
      status ?? this.status,
      key,
      email ?? this.email,
      password ?? this.password,
      passwordVisible ?? this.passwordVisible,
      error ?? this.error
    );
  }

  /// State parameters that will be observed for changes
  @override
  List<Object> get props => [
    status, email, password, passwordVisible, error
  ];
}
