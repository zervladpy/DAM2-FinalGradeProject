part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState._(this.currentIndex);
  final int currentIndex;

  factory NavigationState.initial(int? index) => NavigationState._(index ?? 0);

  NavigationState copyWith(
    int index
  ) {
    return NavigationState._(index);
  }

  @override
  List<Object?> get props => [currentIndex];
}

