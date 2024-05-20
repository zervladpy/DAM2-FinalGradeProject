import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'manage_event.dart';
part 'manage_state.dart';

class ManageBloc extends Bloc<ManageEvent, ManageState> {
  ManageBloc() : super(ManageState.initial()) {
    on<ManageEvent>((event, emit) {});
  }
}
