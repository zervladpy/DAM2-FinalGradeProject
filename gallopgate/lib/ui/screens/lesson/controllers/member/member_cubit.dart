import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/lesson/lesson_dto.dart';
import 'package:gallopgate/models/lesson_member/lesson_member.dart';
import 'package:gallopgate/models/profile/profile.dart';

part 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
  final LessonDto lesson;

  MemberCubit({
    required this.lesson,
  }) : super(MemberState.initial());

  void setProfile(Profile profile) {
    emit(state.copyWith(profile: profile));
  }

  void setHorse(Horse horse) {
    emit(state.copyWith(horse: horse));
  }

  void clear() {
    emit(MemberState.initial());
  }

  LessonMember getLessonMember() {
    return LessonMember(
      profile: state.profile,
      horse: state.horse,
      lesson: lesson.id,
    );
  }
}
