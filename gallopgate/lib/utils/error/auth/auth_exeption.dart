
import 'package:gallopgate/utils/error/auth/auth_error.dart';
import 'package:gallopgate/utils/error/exception.dart';

/// APP Authorization main [GException] class
class AuthException extends GException {
  
  const AuthException({required this.error});

  final String error;
}

/// [AuthException] on Login
class AuthLoginException extends AuthException {
  const AuthLoginException._({required super.error});

  factory AuthLoginException.unkonwn() {
    return AuthLoginException._(error: LoginError.unkonwn.error);
  }

  factory AuthLoginException.invalidEmail() {
    return AuthLoginException._(error: LoginError.invalidEmail.error);
  }

  factory AuthLoginException.invalidPassword() {
    return AuthLoginException._(error: LoginError.invalidPassword.error);
  }

  factory AuthLoginException.userDisabled() {
    return AuthLoginException._(error: LoginError.userDisabled.error);
  }

  factory AuthLoginException.userNotFound() {
    return AuthLoginException._(error: LoginError.userNotFound.error);
  }
}

/// [AuthException] on Signup
class AuthSignupException extends AuthException {
  const AuthSignupException._({required super.error});

  factory AuthSignupException.unkonwn() {
    return AuthSignupException._(error: SignupError.unkonwn.error);
  }

  factory AuthSignupException.invalidEmail() {
    return AuthSignupException._(error: SignupError.invalidEmail.error);
  }
  
  factory AuthSignupException.emailInUse() {
    return AuthSignupException._(error: SignupError.emailInUse.error);
  }

  factory AuthSignupException.weekPassword() {
    return AuthSignupException._(error: SignupError.weakPassword.error);
  }

  factory AuthSignupException.operationNotAllowed() {
    return AuthSignupException._(error: SignupError.operationNotAllowed.error);
  }
}