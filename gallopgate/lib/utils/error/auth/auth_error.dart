import 'auth_exeption.dart';

/// [AuthLoginException] error
enum LoginError {
  /// Not registerd error
  unkonwn('unkown-error'),
  /// invalid-email
  invalidEmail('invalid-email'),
  /// invalid-password
  invalidPassword('invalid-password'),
  /// user not found
  userNotFound('user-not-found'),
  /// user disabled
  userDisabled('user-disabled');

  const LoginError(this.error);

  /// Error definition
  final String error;

}

/// [AuthSignupException] error
enum SignupError {
  /// Not registerd error
  unkonwn('unkown-error'),
  /// Email already in use 
  emailInUse('email-in-use'),
  /// Invalid email
  invalidEmail('invalid-email'),
  /// Week Password
  weakPassword('week-password'),
  /// Operation not Allowed
  operationNotAllowed('operation-not-allowed');

  const SignupError(this.error);

  /// Error definition
  final String error;
}