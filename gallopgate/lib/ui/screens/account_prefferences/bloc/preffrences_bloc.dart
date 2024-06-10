import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'preffrences_event.dart';
part 'preffrences_state.dart';

class PreffrencesBloc extends Bloc<PreffrencesEvent, PreffrencesState> {
  PreffrencesBloc() : super(PreffrencesInitial()) {
    on<PreffrencesEvent>((event, emit) {});
  }
}
