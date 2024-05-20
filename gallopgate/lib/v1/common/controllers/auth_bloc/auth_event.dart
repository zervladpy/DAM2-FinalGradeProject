part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthEvent {}

class AuthLogoutEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  const AuthLoginEvent(this.email, this.password);

  final String email, password;

  @override
  List<Object> get props => [email, password];
}

class AuthRegisterEvent extends AuthEvent {
  const AuthRegisterEvent(this.email, this.password);

  final String email, password;

  @override
  List<Object> get props => [email, password];
}
