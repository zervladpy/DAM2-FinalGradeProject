import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallopgate/v1/common/domain/models/user.dart';
import 'package:gallopgate/v1/common/domain/use_cases/user/update_user_use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final User _initial;

  final UpdateUserUseCase _updateUserUseCase;

  UserDetailsCubit(
    User user,
    UpdateUserUseCase updateUserUseCase,
  )   : _initial = user,
        _updateUserUseCase = updateUserUseCase,
        super(UserDetailsState.initial(user));

  void updateName(String name) {
    emit(state.copyWith(name: name));
  }

  bool isValidForUpdate() {
    return state.name.isNotEmpty && state.name != _initial.name;
  }

  Future<void> update() async {
    if (!isValidForUpdate()) return;

    final user = _initial.copyWith(name: state.name);

    Response response = await _updateUserUseCase(
        UpdateUserUseCaseParams(user.copyWith(name: state.name)));

    if (response is SuccessResponse) {
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.error));
    }
  }
}
