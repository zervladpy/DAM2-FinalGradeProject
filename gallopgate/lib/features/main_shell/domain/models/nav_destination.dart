import 'package:flutter/cupertino.dart';

class NavDestination {
  NavDestination(
    this.icon,
    this.selectedIcon,
    this.label,
    this.route,
  );

  final IconData icon;
  final IconData selectedIcon;
  final String label, route;
}
