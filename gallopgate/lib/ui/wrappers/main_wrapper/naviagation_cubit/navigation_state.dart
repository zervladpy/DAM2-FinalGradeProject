part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState._(this.index);

  final int index;

  factory NavigationState.initial(int index) {
    log('NavigationState.initial($index)');

    return NavigationState._(index);
  }

  @override
  List<Object> get props => [index];
}
