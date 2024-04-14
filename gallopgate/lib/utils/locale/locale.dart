import 'dart:ui';

class GLocale {
  const GLocale._();

  static List<Locale> get all => [spanish, english];

  static const Locale spanish = Locale('es');
  static const Locale english = Locale('en');
}
