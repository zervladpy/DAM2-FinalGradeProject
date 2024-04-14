import 'package:gallopgate/utils/response/response.dart';

/// Contract for usecases
/// 
/// - [T] is the return object
abstract class UseCase<T, P extends UsecaseParams> {

  const UseCase();

  /// Async call
  /// 
  /// Returns: [Response] with [T] as data
  Future<Response<T>> call(P params);

}

/// Parameter contract for [UseCase]
abstract class UsecaseParams {
  const UsecaseParams();
}