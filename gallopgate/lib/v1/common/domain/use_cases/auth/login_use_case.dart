import 'package:gallopgate/v1/common/domain/models/auth_user.dart';
import 'package:gallopgate/v1/common/domain/use_cases/auth/auth_use_case.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/exception/app_exception.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

class LoginUseCase extends AuthUseCase<AuthUser, LoginParams> {
  const LoginUseCase(super.repository);

  @override
  Future<Response<AuthUser>> call(LoginParams params) async {
    AuthUser? user;

    try {
      user = await repository.signInWithEmailAndPassword(
        params.email,
        params.password,
      );

      if (user == null) {
        throw const AppException("unexpected-error");
      }
    } on AppException catch (e) {
      return ErrorResponse(e.error);
    }

    return SuccessResponse(user);
  }
}

class LoginParams extends UseCaseParams {
  const LoginParams(this.email, this.password);

  final String email;
  final String password;
}
