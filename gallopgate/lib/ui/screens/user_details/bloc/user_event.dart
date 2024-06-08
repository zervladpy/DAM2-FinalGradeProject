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

class UserDetailFirstNameChangedEvent extends UserEvent {
  const UserDetailFirstNameChangedEvent(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class UserDetailLastNameChangedEvent extends UserEvent {
  const UserDetailLastNameChangedEvent(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class UserDetailEmailChangedEvent extends UserEvent {
  const UserDetailEmailChangedEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class UserDetailRoleChangedEvent extends UserEvent {
  const UserDetailRoleChangedEvent(this.role);

  final Role role;

  @override
  List<Object> get props => [role];
}

class UserDetailSubmittedEvent extends UserEvent {
  const UserDetailSubmittedEvent();

  @override
  List<Object> get props => [];
}
