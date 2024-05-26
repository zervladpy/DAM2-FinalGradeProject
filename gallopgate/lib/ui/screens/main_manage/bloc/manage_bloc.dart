import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/models/lesson/lesson_preview_dto.dart';
import 'package:gallopgate/models/profile/profile_preview_dto.dart';
import 'package:gallopgate/repositories/lecture_repository.dart';
import 'package:gallopgate/repositories/profile_repository.dart';

part 'manage_event.dart';
part 'manage_state.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  final String organizationId;
  final ProfileRepository profileRepository;
  final LectureRepository lectureRepository;

  late StreamSubscription<List<ProfilePreviewDto>> profileStream;
  late StreamSubscription<List<LessonPreviewDto>> lectureStream;

  ManageBloc({
    required this.organizationId,
    required this.profileRepository,
    required this.lectureRepository,
  }) : super(ManageState.initial()) {
    on<ManageEventInitialize>(_initialize);
    on<ManageEventProfilesUpdated>(_profilesUpdated);
    on<ManageEventLessonsUpdated>(_lessonsUpdated);
  }

  @override
  Future<void> close() {
    profileStream.cancel();
    lectureStream.cancel();
    return super.close();
  }

  FutureOr<void> _initialize(
    ManageEventInitialize event,
    Emitter<ManageState> emit,
  ) async {
    profileStream = profileRepository.watchAll(organizationId).listen((event) {
      add(ManageEventProfilesUpdated(event));
    });
    lectureStream = lectureRepository.watch(organizationId).listen((event) {
      add(ManageEventLessonsUpdated(event));
    });
  }

  FutureOr<void> _profilesUpdated(
    ManageEventProfilesUpdated event,
    Emitter<ManageState> emit,
  ) {
    emit(state.copyWith(profiles: event.profiles));
  }

  FutureOr<void> _lessonsUpdated(
    ManageEventLessonsUpdated event,
    Emitter<ManageState> emit,
  ) {
    emit(state.copyWith(lessons: event.lessons));
  }
}
