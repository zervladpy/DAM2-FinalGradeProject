part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated }

class AuthState extends Equatable {
  const AuthState._(this.status, this.user, this.error);

  final AuthStatus status;
  final AuthUser user;
  final String error;

  factory AuthState.initial() => AuthState._(
        AuthStatus.initial,
        AuthUser.empty(),
        '',
      );

  factory AuthState.authenticate(AuthUser user) => AuthState._(
        AuthStatus.authenticated,
        user,
        '',
      );

  factory AuthState.logout() => AuthState._(
        AuthStatus.unauthenticated,
        AuthUser.empty(),
        '',
      );

  AuthState copyWith({
    AuthStatus? status,
    AuthUser? user,
    String? error,
  }) =>
      AuthState._(
        status ?? this.status,
        user ?? this.user,
        error ?? this.error,
      );

  @override
  List<Object> get props => [status, user, error];
}
