part of 'member_cubit.dart';

class MemberState extends Equatable {
  const MemberState._({
    this.profile = Profile.empty,
    this.horse = Horse.empty,
  });

  final Profile profile;
  final Horse horse;

  factory MemberState.initial() => const MemberState._();

  MemberState copyWith({
    Profile? profile,
    Horse? horse,
  }) {
    return MemberState._(
      profile: profile ?? this.profile,
      horse: horse ?? this.horse,
    );
  }

  @override
  List<Object> get props => [];
}
