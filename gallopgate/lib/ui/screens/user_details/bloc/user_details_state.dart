part of 'user_details_bloc.dart';

class UserDetailsState extends Equatable {
  const UserDetailsState._(this.status, this.profile, this.error);

  final Status status;
  final Profile profile;
  final String? error;

  factory UserDetailsState.initial() {
    return const UserDetailsState._(Status.initial, Profile.empty, null);
  }

  UserDetailsState copyWith({
    Status? status,
    Profile? profile,
    String? error,
  }) {
    return UserDetailsState._(
      status ?? this.status,
      profile ?? this.profile,
      error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, profile, error];
}
