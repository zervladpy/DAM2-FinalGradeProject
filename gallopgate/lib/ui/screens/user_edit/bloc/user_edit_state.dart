part of 'user_edit_bloc.dart';

class UserEditState extends Equatable {
  const UserEditState._(this.status, this.profile, this.error);

  final Status status;
  final Profile profile;
  final String? error;

  factory UserEditState.initial() {
    return const UserEditState._(Status.initial, Profile.empty, null);
  }

  UserEditState copyWith({
    Status? status,
    Profile? profile,
    String? error,
  }) {
    return UserEditState._(
      status ?? this.status,
      profile ?? this.profile,
      error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, profile, error];
}
