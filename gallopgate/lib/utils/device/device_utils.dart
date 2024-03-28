import 'package:flutter/material.dart';

/// Utility class for device related operations
class GDeviceUtils {
  const GDeviceUtils._();

  /// Return device Size
  static Size getDeviceSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Return device width
  static double getDeviceWidth(BuildContext context) {
    return getDeviceSize(context).width;
  }

  /// Return device height
  static double getDeviceHeight(BuildContext context) {
    return getDeviceSize(context).height;
  }
}
