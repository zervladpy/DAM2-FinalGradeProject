part of 'page_cubit.dart';

/// Basic page controller state
class PageState extends Equatable {
  const PageState._(this.controller, this.totalPages);

  final PageController controller;
  final int totalPages;

  factory PageState.initial(int totalPages) => PageState._(
        PageController(),
        totalPages,
      );

  @override
  List<Object> get props => [controller];
}
