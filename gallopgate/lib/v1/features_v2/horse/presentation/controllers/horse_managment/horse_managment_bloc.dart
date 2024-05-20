import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'horse_managment_event.dart';
part 'horse_managment_state.dart';

class HorseManagmentBloc extends Bloc<HorseManagmentEvent, HorseManagmentState> {
  HorseManagmentBloc() : super(HorseManagmentInitial()) {
    on<HorseManagmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
