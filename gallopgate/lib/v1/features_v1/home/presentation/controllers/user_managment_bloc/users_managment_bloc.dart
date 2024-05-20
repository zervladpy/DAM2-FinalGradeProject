import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'users_managment_event.dart';
part 'users_managment_state.dart';

class UsersManagmentBloc extends Bloc<UsersManagmentEvent, UsersManagmentState> {
  UsersManagmentBloc() : super(UsersManagmentInitial()) {
    on<UsersManagmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
