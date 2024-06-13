import 'package:gallopgate/models/role/role.dart';

abstract class GRolesUtils {
  static bool isAdmin(List<Role> roles) {
    return roles.any((role) => role.name == 'admin');
  }

  static bool isInstructor(List<Role> roles) {
    return roles.any((role) => role.name == 'instructor');
  }

  static bool isStudent(List<Role> roles) {
    return roles.any((role) => role.name == 'student');
  }
}
