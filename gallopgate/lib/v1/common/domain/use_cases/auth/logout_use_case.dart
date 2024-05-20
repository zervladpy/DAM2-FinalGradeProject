import 'package:gallopgate/v1/common/domain/use_cases/auth/auth_use_case.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';
import 'package:gallopgate/v1/resources/response/response.dart';

class LogoutUseCase extends AuthUseCase<void, LogoutParams> {
  const LogoutUseCase(super.repository);

  @override
  Future<Response<void>> call(LogoutParams params) async {
    await repository.logout();
    return const SuccessResponse(null);
  }
}

class LogoutParams extends UseCaseParams {}
