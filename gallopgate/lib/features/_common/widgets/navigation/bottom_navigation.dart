import 'package:flutter/material.dart';

import 'navigation_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.items,
  });

  final List<NavigationItem> items;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: true,
      items: items.map(
        (NavigationItem item) {
          return BottomNavigationBarItem(
            label: item.label,
            icon: Icon(item.icon),
            activeIcon: Icon(item.selectedIcon),
            tooltip: item.label,
          );
        },
      ).toList(),
    );
  }
}
