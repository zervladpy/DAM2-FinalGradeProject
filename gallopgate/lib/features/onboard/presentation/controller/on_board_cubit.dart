import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'on_board_state.dart';

class OnBoardCubit extends Cubit<OnBoardState> {

  OnBoardCubit({required int totalPages, required this.onFinish}) : super(OnBoardState.initial(totalPages));
  final VoidCallback onFinish;

  void onPageChanged(int index) {
    state.controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onNextPage() {
    if (state.controller.page == state.totalPages - 1) {
      onSkip();
    } else {
      state.controller.nextPage(
          duration: Durations.medium2,
          curve: Curves.easeInOut,
      );
    }
  }

  void onSkip() {
    onFinish();
  }

  @override
  Future<void> close() async {
    state.controller.dispose();
    super.close();
  }
}
