part of 'on_board_cubit.dart';

class OnBoardState extends Equatable {

  const OnBoardState._(this.controller, this.totalPages);

  factory OnBoardState.initial(int totalPages) {
    return OnBoardState._(PageController(), totalPages);
  }

  final PageController controller;
  final int totalPages;

  @override
  List<Object?> get props => [controller];

}
