part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState._({
    this.status = Status.initial,
    this.profile = Profile.empty,
    this.initial = Profile.empty,
    this.error,
    this.edited = false,
  });

  final Status status;
  final Profile profile;
  final Profile initial;
  final bool edited;
  final String? error;

  factory UserState.initial() {
    return const UserState._();
  }

  UserState copyWith({
    Status? status,
    Profile? profile,
    Profile? initial,
    String? error,
    bool? edited,
  }) {
    return UserState._(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      initial: initial ?? this.initial,
      error: error,
      edited: edited ?? this.edited,
    );
  }

  @override
  List<Object?> get props => [status, profile, initial, error, edited];
}
