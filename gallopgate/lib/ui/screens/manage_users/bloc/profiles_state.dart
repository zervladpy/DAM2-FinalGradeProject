part of 'profiles_bloc.dart';

class ProfilesState extends Equatable {
  const ProfilesState._({
    this.status = Status.initial,
    this.profiles = const [],
    this.filtered = const [],
    this.error,
  });

  final Status status;
  final List<Profile> profiles;
  final List<Profile> filtered;
  final String? error;

  factory ProfilesState.initial() => const ProfilesState._();

  ProfilesState copyWith({
    Status? status,
    List<Profile>? profiles,
    List<Profile>? filtered,
    String? error,
  }) {
    return ProfilesState._(
      status: status ?? this.status,
      profiles: profiles ?? this.profiles,
      filtered: filtered ?? this.filtered,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, profiles, filtered, error];
}
