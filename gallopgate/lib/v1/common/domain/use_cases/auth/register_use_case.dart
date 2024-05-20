import 'package:gallopgate/v1/common/domain/models/auth_user.dart';
import 'package:gallopgate/v1/common/domain/models/user.dart';
import 'package:gallopgate/v1/common/domain/repositories/user/user_repository.dart';
import 'package:gallopgate/v1/common/domain/use_cases/auth/auth_use_case.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/exception/app_exception.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

class RegisterUseCase extends AuthUseCase<AuthUser, RegisterParams> {
  const RegisterUseCase(super.repository, this.userRepository);

  final UserRepository userRepository;

  @override
  Future<Response<AuthUser>> call(RegisterParams params) async {
    AuthUser? user;

    try {
      user = await repository.registerWithEmailAndPassword(
        params.email,
        params.password,
      );

      if (user == null) {
        throw const AppException("unexpected-error");
      }

      userRepository.createUser(
        User(
            id: user.id,
            email: user.email,
            name: '',
            photoUrl: '',
            roles: const [],
            organizationId: ''),
      );
    } on AppException catch (e) {
      return ErrorResponse(e.error);
    }

    return SuccessResponse(user);
  }
}

class RegisterParams extends UseCaseParams {
  const RegisterParams(this.email, this.password);

  final String email;
  final String password;
}
