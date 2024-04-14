import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit(
    int totalPages, {
    this.curve,
    this.duration,
  }) : super(PageState.initial(totalPages));

  final Curve? curve;
  final Duration? duration;

  /// Go to next page
  void nextPage() {
    state.controller.nextPage(
      duration: duration ?? Durations.medium2,
      curve: curve ?? Curves.easeIn,
    );
  }

  /// Go to previous page
  void prevPage() {
    state.controller.previousPage(
      duration: duration ?? Durations.medium2,
      curve: curve ?? Curves.easeIn,
    );
  }

  /// Jumps to a selected page
  void jumpToPage(int page) {
    // --- Guard --- //
    if (page > state.totalPages) return;

    state.controller.jumpToPage(page);
  }

  /// Jumps to last page
  void skip() {
    jumpToPage(state.totalPages);
  }
}
