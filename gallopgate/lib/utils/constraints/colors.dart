import 'dart:ui';

/// Colors for GallopGate App
class GColor {
  const GColor._();

  // --- Transparent --- //
  static Color get transparent => const Color(0x00000000);

  // --- Most Used Colors --- //
  static Color get primary => const Color(0xFF276FbF);
  static Color get secondary => const Color(0xFF153B66);
  static Color get accent => const Color(0xFFA3C4BC);

  // --- Text Colors --- //
  static Color get lightTextColor => const Color(0xFF0B0B0B);
  static Color get darkTextColor => const Color(0xFFF9F6EE); // Snow

  // --- Background Colors --- //
  static Color get darkBackground => const Color(0xFF0B0B0B);
  static Color get lightBackground => const Color(0xFFF9F6EE); // Snow

  // --- Validation Colors --- //
  static Color get error => const Color(0xFFCA3433);
  static Color get success => const Color(0xFF008000);
  static Color get warning => const Color(0xFFF28F1C);
  static Color get info => const Color(0xFFFFFF00);

  // --- Neutral --- //
  static Color get white => const Color(0xFFFFFFFF);
  static Color get gray => const Color(0xFF808080);
  static Color get black => const Color(0xFF000000);
}
