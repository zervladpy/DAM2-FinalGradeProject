import 'package:gallopgate/v1/common/domain/repositories/auth/auth_repository.dart';
import 'package:gallopgate/v1/common/domain/use_cases/use_case.dart';

abstract class AuthUseCase<T, Params extends UseCaseParams>
    extends UseCase<T, Params> {
  const AuthUseCase(this.repository);
  final AuthRepository repository;
}
