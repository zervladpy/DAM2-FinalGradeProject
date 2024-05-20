import 'package:gallopgate/v1/common/domain/models/user.dart';
import 'package:gallopgate/v1/common/domain/repositories/user/user_repository.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

class CreateUserUseCase extends UseCase<User, CreateUserUseCaseParams> {
  const CreateUserUseCase(UserRepository repository) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<Response<User>> call(CreateUserUseCaseParams params) async {
    User? user;

    try {
      user = await _repository.createUser(params.user);

      if (user == null) throw Exception('User not created');
    } catch (e) {
      return ErrorResponse(e.toString());
    }

    return SuccessResponse(user);
  }
}

class CreateUserUseCaseParams extends UseCaseParams {
  const CreateUserUseCaseParams({
    required this.user,
  });

  final User user;
}
