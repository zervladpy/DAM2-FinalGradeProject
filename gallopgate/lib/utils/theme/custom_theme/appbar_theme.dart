import 'package:flutter/material.dart';

import '../../constraints/_constraints_library.dart';

/// Custom theme for AppBar
class GAppBarTheme {
  const GAppBarTheme._();

  /// Light theme for AppBar
  static AppBarTheme get light => AppBarTheme(
        scrolledUnderElevation: 0,

        // --- Color --- //
        backgroundColor: GColor.lightBackground,
        // --- Title Style --- //
        titleTextStyle: const TextStyle().copyWith(
          fontSize: GSizes.fontXl,
          color: GColor.lightTextColor,
        ),
        //--- Icon Theme ---//
        iconTheme: const IconThemeData().copyWith(
          color: GColor.lightTextColor,
        ),
      );

  /// Dark theme for AppBar
  static AppBarTheme get dark => AppBarTheme(
        scrolledUnderElevation: 0,

        // --- Color --- //
        backgroundColor: GColor.darkBackground,

        // --- Title Style --- //
        titleTextStyle: const TextStyle().copyWith(
          fontSize: GSizes.fontXl,
          color: GColor.darkTextColor,
        ),

        //--- Icon Theme ---//
        iconTheme: const IconThemeData().copyWith(
          color: GColor.darkTextColor,
        ),
      );
}
