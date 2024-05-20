import 'dart:developer';

import 'package:gallopgate/v1/common/domain/models/user.dart';
import 'package:gallopgate/v1/common/domain/repositories/user/user_repository.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

class FetchUserUseCase extends UseCase<User, FetchUserUseCaseParams> {
  const FetchUserUseCase(UserRepository repository) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<Response<User>> call(FetchUserUseCaseParams params) async {
    User? user;

    try {
      user = await _repository.fetchUser(params.id);
      log('User fetched: $user');
      if (user == null) throw Exception('User not found');
    } catch (e) {
      return ErrorResponse(e.toString());
    }

    return SuccessResponse(user);
  }
}

class FetchUserUseCaseParams extends UseCaseParams {
  const FetchUserUseCaseParams({
    required this.id,
  });

  final String id;
}
