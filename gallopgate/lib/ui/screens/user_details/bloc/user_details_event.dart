part of 'user_details_bloc.dart';

abstract class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();

  @override
  List<Object> get props => [];
}

class UserDetailsInitialize extends UserDetailsEvent {
  final String profileId;

  const UserDetailsInitialize(this.profileId);

  @override
  List<Object> get props => [profileId];
}

class UserDetailFirstNameChangedEvent extends UserDetailsEvent {
  const UserDetailFirstNameChangedEvent(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class UserDetailLastNameChangedEvent extends UserDetailsEvent {
  const UserDetailLastNameChangedEvent(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class UserDetailEmailChangedEvent extends UserDetailsEvent {
  const UserDetailEmailChangedEvent(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class UserDetailRoleChangedEvent extends UserDetailsEvent {
  const UserDetailRoleChangedEvent(this.role);

  final Role role;

  @override
  List<Object> get props => [role];
}

class UserDetailSubmittedEvent extends UserDetailsEvent {
  const UserDetailSubmittedEvent();

  @override
  List<Object> get props => [];
}
