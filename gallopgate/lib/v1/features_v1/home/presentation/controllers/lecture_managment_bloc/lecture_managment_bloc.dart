import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lecture_managment_event.dart';
part 'lecture_managment_state.dart';

class LectureManagmentBloc extends Bloc<LectureManagmentEvent, LectureManagmentState> {
  LectureManagmentBloc() : super(LectureManagmentInitial()) {
    on<LectureManagmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
