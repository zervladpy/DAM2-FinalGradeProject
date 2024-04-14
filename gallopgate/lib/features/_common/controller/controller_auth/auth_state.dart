part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState._(this.state);

  final AuthenticationState state;

  factory AuthState.initial() => const AuthState._(AuthenticationState.noAuthenticated);

  factory AuthState.authenticated() => const AuthState._(AuthenticationState.authenticated);

  @override
  List<Object?> get props => [state];

}