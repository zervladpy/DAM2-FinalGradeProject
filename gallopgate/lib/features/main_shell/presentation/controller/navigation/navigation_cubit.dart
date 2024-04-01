import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit(int? index) : super(NavigationState.initial(index));

  void setIndex(int index) {
    emit(state.copyWith(index));
  }

}
