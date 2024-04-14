import 'package:gallopgate/core/router/app_router.dart';

/// [GRouter] constraint Routes
class GRoutes {
  const GRoutes._();

  /// Initial app [GRoutes]
  ///
  /// route: **DYNAMIC**
  static String get initialLocation => onboard;

  /// All routes accessible for not authenticated user
  static List<String> authRoutes = [onboard, auth, signup];

  // --- Auth Routes --- //

  /// route: **/onboard**
  static String get onboard => '/onboard';

  /// route: **/auth**
  static String get auth => '/auth';

  /// route: **/auth/signup**
  static String get signup => '$auth/signup';

  /// Used on [GRouter] configuration, don't use in app routing
  ///
  /// Use [GRoutes.signup] instead
  ///
  /// route: **signup**
  static String get signupRaw => 'signup';

  // --- Routes --- //
  /// route: **/dashboard**
  static String get home => '/home';

  /// route: **/schedule**
  static String get schedule => '/schedule';

  /// route: **/chat**
  static String get chat => '/chat';

  /// route: **/account**
  static String get account => '/account';
}
