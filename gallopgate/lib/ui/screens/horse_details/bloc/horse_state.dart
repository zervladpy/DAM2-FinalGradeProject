part of 'horse_bloc.dart';

class HorseState extends Equatable {
  const HorseState._({
    this.error,
    this.status = Status.initial,
    this.initial = Horse.empty,
    this.horse = Horse.empty,
    this.profiles = const <Profile>[],
    this.owner,
    this.edited = false,
  });

  final Status status;
  final String? error;
  final bool edited;
  final Horse initial;
  final Horse horse;
  final Profile? owner;
  final List<Profile> profiles;

  factory HorseState.initial() => const HorseState._();

  HorseState copyWith({
    Status? status,
    String? error,
    Horse? initial,
    Horse? horse,
    bool? edited,
    Profile? owner,
    List<Profile>? profiles,
  }) {
    return HorseState._(
      status: status ?? this.status,
      error: error,
      initial: initial ?? this.initial,
      horse: horse ?? this.horse,
      profiles: profiles ?? this.profiles,
      owner: owner ?? this.owner,
      edited: edited ?? this.edited,
    );
  }

  @override
  List<Object?> get props => [
        status,
        error,
        initial,
        horse,
        profiles,
        owner,
        edited,
      ];
}
