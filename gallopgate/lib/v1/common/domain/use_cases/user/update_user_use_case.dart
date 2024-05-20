import 'package:gallopgate/v1/common/domain/models/user.dart';
import 'package:gallopgate/v1/common/domain/repositories/user/user_repository.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

class UpdateUserUseCase extends UseCase<void, UpdateUserUseCaseParams> {
  const UpdateUserUseCase(UserRepository repository) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<Response<void>> call(UpdateUserUseCaseParams params) async {
    try {
      await _repository.updateUser(params.user);
    } catch (e) {
      return ErrorResponse(e.toString());
    }

    return const SuccessResponse(null);
  }
}

class UpdateUserUseCaseParams extends UseCaseParams {
  const UpdateUserUseCaseParams(this.user);

  final User user;
}
