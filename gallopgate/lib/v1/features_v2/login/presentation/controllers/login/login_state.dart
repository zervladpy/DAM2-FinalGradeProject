part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, error }

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}
