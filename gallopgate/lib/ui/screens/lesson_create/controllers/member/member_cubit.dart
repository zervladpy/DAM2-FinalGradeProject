import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/profile/profile.dart';

part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
  final Function(Profile, Horse?)? save;

  MemberCubit({required this.save}) : super(MemberState.initial());

  void setProfile(Profile profile) => emit(state.copyWith(profile: profile));

  void setHorse(Horse horse) => emit(state.copyWith(horse: horse));

  void clear() => emit(MemberState.initial());

  void submit() {
    save?.call(state.profile, state.horse);
  }
}
