import 'package:gallopgate/core/data/repository/auth/firebase_repository_authentication.dart';
import 'package:gallopgate/core/domain/models/model_user.dart';
import 'package:gallopgate/utils/error/auth/auth_exeption.dart';
import 'package:gallopgate/utils/response/response.dart';
import 'package:gallopgate/utils/usecase/usecase.dart';

/// 
class SignupUsecase extends UseCase<User, SignupUsecaseParams>{

  const SignupUsecase(this.repository);  

  final FirebaseAuthenticationRepository repository;

  @override
  Future<Response<User>> call(SignupUsecaseParams params) async {
    try {
      var user = await repository.signupWithEmailAndPassword(params.email, params.password);
      return Response.success(user!);
    
    } on AuthSignupException catch (e) {
      return Response.failure(e.error);
    }

  }
}

/// Signup Usecase Parameter class
/// 
/// - [email] - String
/// - [password] - String
class SignupUsecaseParams extends UsecaseParams {

  const SignupUsecaseParams(this.email, this.password);

  final String email, password;
}