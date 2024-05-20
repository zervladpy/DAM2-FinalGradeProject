import 'package:gallopgate/v1/common/domain/models/auth_user.dart';
import 'package:gallopgate/v1/common/domain/use_cases/auth/auth_use_case.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

class CurrentUserUseCase extends AuthUseCase<AuthUser, UseCaseParams> {
  const CurrentUserUseCase(super.repository);

  @override
  Future<Response<AuthUser>> call(UseCaseParams params) async {
    AuthUser? user = repository.currentUser;

    if (user == null) {
      return const ErrorResponse("un-authenticated");
    }

    return SuccessResponse(user);
  }
}
