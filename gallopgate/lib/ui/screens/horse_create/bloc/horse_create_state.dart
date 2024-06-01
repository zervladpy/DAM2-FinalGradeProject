part of 'horse_create_bloc.dart';

class HorseCreateState extends Equatable {
  const HorseCreateState._({
    this.status = Status.initial,
    this.horse = Horse.empty,
    this.profiles = const [],
    this.error,
  });

  final Status status;
  final List<Profile> profiles;
  final Horse horse;
  final String? error;

  factory HorseCreateState.initial() => const HorseCreateState._();

  HorseCreateState copyWith({
    Status? status,
    Horse? horse,
    List<Profile>? profiles,
    String? error,
  }) {
    return HorseCreateState._(
      status: status ?? this.status,
      horse: horse ?? this.horse,
      profiles: profiles ?? this.profiles,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, horse, error, profiles];
}
