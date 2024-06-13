part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class Fetch extends UserEvent {
  final String id;

  const Fetch({required this.id});

  @override
  List<Object> get props => [id];
}

class FirstNameChanged extends UserEvent {
  const FirstNameChanged(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class LastNameChanged extends UserEvent {
  const LastNameChanged(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class EmailChanged extends UserEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class RoleChanged extends UserEvent {
  const RoleChanged(this.role);

  final Role role;

  @override
  List<Object> get props => [role];
}

class BirthDateChanged extends UserEvent {
  const BirthDateChanged(this.birthDate);

  final DateTime birthDate;

  @override
  List<Object> get props => [birthDate];
}

class Update extends UserEvent {
  const Update();

  @override
  List<Object> get props => [];
}
