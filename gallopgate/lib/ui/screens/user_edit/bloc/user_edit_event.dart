part of 'user_edit_bloc.dart';

abstract class UserEditEvent extends Equatable {
  const UserEditEvent();
}

class UserEditFetch extends UserEditEvent {
  const UserEditFetch(this.profileId);

  final String profileId;

  @override
  List<Object> get props => [profileId];
}

class UserEditFirstNameChanged extends UserEditEvent {
  const UserEditFirstNameChanged(this.firstName);

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class UserEditLastNameChanged extends UserEditEvent {
  const UserEditLastNameChanged(this.lastName);

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class UserEditUpdateSubmit extends UserEditEvent {
  const UserEditUpdateSubmit();

  @override
  List<Object> get props => [];
}
