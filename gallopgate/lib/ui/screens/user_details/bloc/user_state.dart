part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState._(this.status, this.profile, this.error);

  final Status status;
  final Profile profile;
  final String? error;

  factory UserState.initial() {
    return const UserState._(Status.initial, Profile.empty, null);
  }

  UserState copyWith({
    Status? status,
    Profile? profile,
    String? error,
  }) {
    return UserState._(
      status ?? this.status,
      profile ?? this.profile,
      error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, profile, error];
}
