/// [AuthUser] model class
class AuthUser {
  const AuthUser(this.id, this.email);

  final String id;
  final String email;

  factory AuthUser.empty() => const AuthUser("", "");
}
