import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_schedule_event.dart';
part 'create_schedule_state.dart';

class CreateScheduleBloc
    extends Bloc<CreateScheduleEvent, CreateScheduleState> {
  CreateScheduleBloc() : super(CreateScheduleBlocInitial()) {
    on<CreateScheduleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
