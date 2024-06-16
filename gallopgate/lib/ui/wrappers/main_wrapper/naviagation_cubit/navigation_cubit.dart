import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final BuildContext context;
  final GoRouterState routerState;
  final Map<int, String> routes;

  NavigationCubit({
    required this.context,
    required this.routerState,
    required this.routes,
    required int initialIndex,
  }) : super(NavigationState.initial(initialIndex));

  void changeIndex(int index) {
    if (routes[index] == null) return;

    emit(NavigationState._(index));

    if (routes[index] == routerState.matchedLocation) return;

    context.go(routes[index]!);
  }
}
