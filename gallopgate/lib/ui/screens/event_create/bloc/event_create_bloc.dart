import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'event_create_event.dart';
part 'event_create_state.dart';

class EventCreateBloc extends Bloc<EventCreateEvent, EventCreateState> {
  EventCreateBloc() : super(EventCreateInitial()) {
    on<EventCreateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
