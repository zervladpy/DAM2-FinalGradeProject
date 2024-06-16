import 'package:gallopgate/common/enums/data_validation.dart';

abstract class GValidator {
  static DataValidation required(String? value) {
    if (value == null) return DataValidation.required;
    if (value.isEmpty) return DataValidation.required;
    return DataValidation.none;
  }

  static DataValidation email(String? value) {
    if (value == null) return DataValidation.required;
    if (value.isEmpty) return DataValidation.required;
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return DataValidation.emailInvalidFormat;
    }
    return DataValidation.none;
  }

  static DataValidation password(String? value) {
    if (value == null) return DataValidation.required;
    if (value.isEmpty) return DataValidation.required;
    if (value.length < 6) return DataValidation.passwordTooShort;
    if (value.length > 20) return DataValidation.passwordTooLong;
    return DataValidation.none;
  }

  static DataValidation repeatPassword(String? value, String? password) {
    if (value == null) return DataValidation.required;
    if (value.isEmpty) return DataValidation.required;
    if (value != password) return DataValidation.passwordNoMatch;
    return DataValidation.none;
  }
}
