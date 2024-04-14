import 'package:gallopgate/utils/validator/input_error.dart';

/// base input validation
class InputValidator {
  const InputValidator._();

  static InputError requiredField(String value) {
    return value.isEmpty ? InputError.required : InputError.noError;
  }

  static InputError emailValidation(String value) {
    // TODO: validate email

    if (value.isEmpty) {
      return InputError.required;
    }

    if (!value.contains("@")) {
      return InputError.badFormat;
    }

    return InputError.noError;
  }

  static InputError validatePassword(String value) {
    if (value.isEmpty) {
      return InputError.required;
    }

    return InputError.noError;
  }

  static InputError validateRepeatPassword(String value, String value2) {
    return value == value2 ? InputError.noError : InputError.badFormat;
  }
}
