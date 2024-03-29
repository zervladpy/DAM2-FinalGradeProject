import 'package:flutter/material.dart';

import '../../constraints/_constraints_library.dart';

/// Custom theme for BottomNavigationBar
class GNavigationBarTheme {
  const GNavigationBarTheme._();

  /// Light theme for BottomNavigationBar
  static NavigationBarThemeData get light => NavigationBarThemeData(
        // --- Color --- //
        backgroundColor: GColor.transparent,
        surfaceTintColor: GColor.lightBackground,
        indicatorColor: GColor.transparent,
        // --- Label Style --- //
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle().copyWith(
            color: GColor.lightTextColor,
          ),
        ),
        // --- Icon Style --- //
        iconTheme: MaterialStateProperty.all(
          const IconThemeData().copyWith(
            color: GColor.lightTextColor,
            size: GSizes.iconLg * 1.5,
          ),
        ),
        // --- Shape --- //
        indicatorShape: const CircleBorder(),
      );

  /// Dark theme for BottomNavigationBar
  static NavigationBarThemeData get dark => NavigationBarThemeData(
        // --- Color --- //
        backgroundColor: GColor.transparent,
        surfaceTintColor: GColor.darkBackground,
        indicatorColor: GColor.transparent,

        // --- Label Style --- //
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle().copyWith(
            color: GColor.darkTextColor,
          ),
        ),

        // --- Icon Style --- //
        iconTheme: MaterialStateProperty.all(
          const IconThemeData().copyWith(
            color: GColor.darkTextColor,
            size: GSizes.iconLg * 1.5,
          ),
        ),

        // --- Shape --- //
        indicatorShape: const CircleBorder(),
      );
}
