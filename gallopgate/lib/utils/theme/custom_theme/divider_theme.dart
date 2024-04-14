import 'package:flutter/material.dart';

import '../../constraints/_constraints_library.dart';

class GDividerTheme {
  const GDividerTheme._();

  static DividerThemeData get light => DividerThemeData(
        color: GColor.darkBackground,
        thickness: 0.5,
      );

  static DividerThemeData get dark => DividerThemeData(
        color: GColor.lightBackground,
        thickness: 0.5,
      );
}
