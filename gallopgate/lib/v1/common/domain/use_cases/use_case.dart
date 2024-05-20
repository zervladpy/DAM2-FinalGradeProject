import 'package:gallopgate/v1/resources/response/response.dart';

/// Contract for UseCases
abstract class UseCase<M, Params extends UseCaseParams> {
  const UseCase();

  Future<Response<M>> call(Params params);
}

class UseCaseParams {
  const UseCaseParams();
}
