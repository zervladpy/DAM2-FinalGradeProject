import 'package:gallopgate/v1/resources/exception/app_exception.dart';

class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException(super.error);
}

class InvalidEmailException extends AppException {
  const InvalidEmailException(super.error);
}

class AccountLockedException extends AppException {
  const AccountLockedException(super.error);
}

class CanNotCreateAccountAtThisMoment extends AppException {
  const CanNotCreateAccountAtThisMoment(super.error);
}
