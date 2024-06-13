part of 'auth_cubit.dart';

class AuthState extends Equatable {
  const AuthState._(this.status, this.profile);

  final AuthStatus status;
  final Profile profile;

  const AuthState.authenticated(Profile profile)
      : this._(AuthStatus.authenticated, profile);
  const AuthState.unauthenticated()
      : this._(AuthStatus.unauthenticated, Profile.empty);

  @override
  List<Object> get props => [status];
}
