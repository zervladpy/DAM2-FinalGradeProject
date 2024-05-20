part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState._(this.index);

  final int index;

  factory NavigationState.initial() => const NavigationState._(0);
  
  NavigationState copyWith({
    int? index
  }) =>  NavigationState._(index ?? this.index);

  @override
  List<Object?> get props => [index];

}

