part of 'create_user_bloc.dart';

abstract class CreateUserEvent extends Equatable {
  const CreateUserEvent();

  @override
  List<Object> get props => [];
}

class CreateUserInitialize extends CreateUserEvent {}

class CreateUserFirstNameChanged extends CreateUserEvent {
  const CreateUserFirstNameChanged(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class CreateUserLastNameChanged extends CreateUserEvent {
  const CreateUserLastNameChanged(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class CreateUserRoleChanged extends CreateUserEvent {
  const CreateUserRoleChanged(this.role);

  final Role role;

  @override
  List<Object> get props => [role];
}

class CreateUserEmailChanged extends CreateUserEvent {
  const CreateUserEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class CreateUserSubmitted extends CreateUserEvent {}
