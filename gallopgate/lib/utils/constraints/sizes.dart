import 'package:flutter/material.dart';

/// Siezes used in the app
class GSizes {
  const GSizes._();

  // --- Zero --- //
  static double get zero => 0.0;

  // --- Padding and margin sizes --- //
  static double get xs => 4.0;

  static double get sm => 8.0;

  static double get md => 16.0;

  static double get lg => 24.0;

  static double get xl => 32.0;

  // --- Icons Sizes --- //
  static double get icnoSm => 8.0;

  static double get iconMd => 12.0;

  static double get iconLg => 20.0;

  // --- Font Sizes --- //
  static double get fontSm => 8.0;

  static double get fontMd => 12.0;

  static double get fontLg => 16.0;

  static double get fontXl => 30.0;

  // --- Font Weights --- //
  static FontWeight get fontLight => FontWeight.normal;

  static FontWeight get fontMdBold => FontWeight.w600;

  static FontWeight get fontBold => FontWeight.bold;

  // --- Radius Sizes --- //
  static double get borderRadiusSm => 4.0;

  static double get borderRadiusMd => 7.0;

  static double get borderRadiusLg => 10.0;

  // --- Border Side --- //
  static double get defaultBorderSide => 1.0;

  static double get focusedBorderSide => 1.5;

  // --- Elevation --- //
  static double get defaultElevation => 4.0;

  // --- Separation --- //
  /// value: 24.0
  static double get defaultSeparation => 24.0;

  /// value: 12.0
  static double get separationSm => 12.0;

  /// value: 36.0
  static double get separationLg => 36.0;

  // --- Appbar --- //
  static double get appbarHeight => 56.0;

  static double get appbarWithTabHeight => 100.0;

  // --- BottomNavigationBar --- //
  static double get bottomNavigationBarHeight => 56.0;

  // --- Device Max Widths --- //
  static double get mobileMaxWidth => 480.0;

  static double get tabletMaxWidth => 900.0;

  // --- Image Sizes --- //
  static double get imageSm => 48.0;

  static double get imageMd => 96.0;

  static double get imageLg => 144.0;

  static double get imageXl => 192.0;

  // --- Button Sizes --- //
  static double get defaultWidht => 50.0;

  static double get defaultHeight => 50.0;

  // --- Opacity --- //
  static double get opacityLow => 0.2;

  static double get opacityMedium => 0.4;

  static double get opacityHigh => 1.6;

  // --- Tab Height --- //
  static double get tabHeighSm => 20.0;

  static double get tabHeighMd => 30.0;

  static double get tabHeighLg => 40.0;

  // --- Drawer Widths --- //
  /// value: 50.0
  static double get drawerNotExpanded => 75.0;

  /// value: 150.0
  static double get drawerExpanded => 150.0;
}
