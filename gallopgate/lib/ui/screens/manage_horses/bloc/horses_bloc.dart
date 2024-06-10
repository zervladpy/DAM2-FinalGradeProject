import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/repositories/horse_repository.dart';

part 'horses_event.dart';
part 'horses_state.dart';

class HorsesBloc extends Bloc<HorsesEvent, HorsesState> {
  final HorseRepository _horseRepository;

  final String id;

  HorsesBloc({
    required HorseRepository horseRepository,
    required this.id,
  })  : _horseRepository = horseRepository,
        super(HorsesState.initial()) {
    on<Fetch>(_fetch);
  }

  FutureOr<void> _fetch(Fetch event, Emitter<HorsesState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final horses = await _horseRepository.readAllByOrganization(id);
      emit(state.copyWith(
          status: Status.success, horses: horses, filtered: horses));
    } catch (e) {
      emit(state.copyWith(status: Status.error, error: e.toString()));
    }

    emit(state.copyWith(status: Status.initial, error: null));
  }
}
