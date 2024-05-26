import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'horse_details_event.dart';
part 'horse_details_state.dart';

class HorseDetailsBloc extends Bloc<HorseDetailsEvent, HorseDetailsState> {
  HorseDetailsBloc() : super(HorseDetailsInitial()) {
    on<HorseDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
