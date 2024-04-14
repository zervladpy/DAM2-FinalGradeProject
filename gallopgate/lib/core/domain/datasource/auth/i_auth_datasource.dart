import 'package:gallopgate/core/domain/models/model_user.dart';

/// Contract for AuthDatasource
abstract class IAuthDatasource {
  IAuthDatasource();

  /// Current instance of [User]
  User? get currentUser;

  /// Try to authenticate [User] with:
  /// - [email] - String
  /// - [password] - String
  ///
  /// Returns:
  /// - [User] if SUCCESS
  /// - null if FAILURE
  Future<User?> loginWithEmailAndPassword(String email, String password);

  /// Try to create new [User] account with:
  /// - [email] - String
  /// - [password] - String
  ///
  /// Returns:
  /// - [User] if SUCCESS
  /// - null if FAILURE
  Future<User?> signupWithEmailAndPassword(String email, String password);

  /// Logs [User] out
  Future<void> logout();

  /// Gets a authentication status [Stream]
  Stream<bool> get userAuthenticationStream;
}
