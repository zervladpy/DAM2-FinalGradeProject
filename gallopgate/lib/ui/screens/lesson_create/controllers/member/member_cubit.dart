import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/profile/profile.dart';

part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
  MemberCubit() : super(MemberState.initial());

  void setProfile(Profile profile) => emit(state.copyWith(profile: profile));

  void setHorse(Horse horse) => emit(state.copyWith(horse: horse));

  void clear() => emit(MemberState.initial());

  void submit(void Function(Profile, Horse) save) {
    save(state.profile, state.horse);
    clear();
  }
}
