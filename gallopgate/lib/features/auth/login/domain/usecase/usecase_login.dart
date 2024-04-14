import 'package:gallopgate/core/domain/datasource/auth/i_auth_remote_datasource.dart';
import 'package:gallopgate/core/domain/models/model_user.dart';
import 'package:gallopgate/utils/error/auth/auth_exeption.dart';
import 'package:gallopgate/utils/response/response.dart';
import 'package:gallopgate/utils/usecase/usecase.dart';

/// Usecase for login
class LoginUsecase extends UseCase<User, LoginUsecaseParams> {
  const LoginUsecase(this.repository);

  final IAuthRemoteDatasource repository;

  @override
  Future<Response<User>> call(LoginUsecaseParams params) async {
    try {
      var user = await repository.loginWithEmailAndPassword(
          params.email, params.password);
      return Response.success(user!);
    } on AuthLoginException catch (e) {
      return Response.failure(e.error);
    }
  }
}

/// Parameters for LoginUsecase
///
/// - [email] - String
/// - [password] - String
class LoginUsecaseParams extends UsecaseParams {
  const LoginUsecaseParams(this.email, this.password);

  final String email, password;
}
