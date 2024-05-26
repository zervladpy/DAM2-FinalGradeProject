import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/models/schedule/schedule.dart';
import 'package:gallopgate/repositories/lecture_repository.dart';

part 'lesson_create_event.dart';
part 'lesson_create_state.dart';

class LessonCreateBloc extends Bloc<LessonCreateEvent, LessonCreateState> {
  final String organizationId;
  final LectureRepository lectureRepository;

  LessonCreateBloc(
    this.organizationId,
    this.lectureRepository,
  ) : super(LessonCreateState.initial()) {
    on<LessonTitleChanged>(_titleChanged);
    on<LessonDescriptionChanged>(_descriptionChanged);
    on<LessonTiggerOpen>(_onTriggerOpen);
    on<LessonTriggerEnabled>(_onTriggerEnable);
    on<LessonUpdateSchedule>(_onUpdateSchedule);
    on<LessonAddNewScheduleToDay>(_onAddNewSchedule);
    on<LessonSubmit>(_onSubmitt);
  }

  FutureOr<void> _titleChanged(
    LessonTitleChanged event,
    Emitter<LessonCreateState> emit,
  ) {
    emit(state.copyWith(
      lesson: state.lesson.copyWith(title: event.value),
    ));
  }

  FutureOr<void> _descriptionChanged(
    LessonDescriptionChanged event,
    Emitter<LessonCreateState> emit,
  ) {
    emit(state.copyWith(
      lesson: state.lesson.copyWith(description: event.value),
    ));
  }

  FutureOr<void> _onTriggerOpen(
    LessonTiggerOpen event,
    Emitter<LessonCreateState> emit,
  ) {
    var opened = Set.of(state.opened);

    if (opened.contains(event.value)) {
      opened.remove(event.value);
      log("removing");
    } else {
      opened.add(event.value);
      log("adding");
    }
    emit(state.copyWith(opened: opened));
  }

  FutureOr<void> _onTriggerEnable(
    LessonTriggerEnabled event,
    Emitter<LessonCreateState> emit,
  ) {
    var enabled = Map.of(state.enabled);

    var key = event.index;

    enabled[key] = event.value;

    emit(state.copyWith(enabled: enabled));
  }

  FutureOr<void> _onUpdateSchedule(
    LessonUpdateSchedule event,
    Emitter<LessonCreateState> emit,
  ) {}

  FutureOr<void> _onSubmitt(
    LessonSubmit event,
    Emitter<LessonCreateState> emit,
  ) {}

  FutureOr<void> _onAddNewSchedule(
    LessonAddNewScheduleToDay event,
    Emitter<LessonCreateState> emit,
  ) {
    Schedule schedule = Schedule(
      weekDay: event.value,
      creatorId: null,
      instructorId: '',
      organizationId: '',
      startTime: DateTime.now(),
      duration: DateTime.now().add(const Duration(minutes: 30)),
      lectureId: '',
    );

    var schedules = List.of(state.lesson.schedules);
    schedules.add(schedule);
    emit(state.copyWith(lesson: state.lesson.copyWith(schedules: schedules)));
  }
}
