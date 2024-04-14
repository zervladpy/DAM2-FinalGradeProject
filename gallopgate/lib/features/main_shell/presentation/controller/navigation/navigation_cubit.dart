import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit(
    int? index, {
    required this.navigateTo,
    required this.routes,
  }) : super(NavigationState.initial(index));

  final void Function(String route) navigateTo;
  final List<String> routes;

  void setIndex(int index) {
    if (index == state.currentIndex) return;
    emit(state.copyWith(index));
    navigateTo(routes[state.currentIndex]);
  }
}
