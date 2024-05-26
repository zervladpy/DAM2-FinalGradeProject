import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'horse_create_event.dart';
part 'horse_create_state.dart';

class HorseCreateBloc extends Bloc<HorseCreateEvent, HorseCreateState> {
  HorseCreateBloc() : super(HorseCreateInitial()) {
    on<HorseCreateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
