import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shell_state.dart';

class ShellCubit extends Cubit<ShellState> {
  ShellCubit(int? initialIndex) : super(ShellState.initial(initialIndex));

  void onIndexChange(int index) {
    emit(state);
  }
}
