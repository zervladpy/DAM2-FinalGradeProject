part of 'shell_cubit.dart';

class ShellState extends Equatable {
  const ShellState._(this.currentIndex);

  final int currentIndex;

  factory ShellState.initial(int? startIndex) => ShellState._(startIndex ?? 0);

  ShellState copyWith({int? newIndex}) {
    return ShellState._(newIndex ?? currentIndex);
  }

  @override
  List<Object?> get props => [currentIndex];
}
