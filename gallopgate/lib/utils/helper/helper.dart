import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A helper class that contains useful methods for the application.
class GHeleper {
  const GHeleper._();

  /// Check if the current theme is dark mode
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Check if the current theme is light mode
  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  /// Set system overly color
  static Future<void> setSystemOverlayStyle(Color color) async {
    return SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            color.computeLuminance() > 0.5 ? Brightness.dark : Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: color,
      ),
    );
  }
}
