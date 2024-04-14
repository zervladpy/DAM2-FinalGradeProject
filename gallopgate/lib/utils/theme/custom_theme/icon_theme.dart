import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';

class GIconTheme {
  const GIconTheme._();

  static IconThemeData get light => IconThemeData(
        color: GColor.lightTextColor,
      );

  static IconThemeData get dark => IconThemeData(
        color: GColor.darkTextColor,
      );
}
