import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/navigation/navigation_item.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  final List<NavigationItem> items;
  final int selectedIndex;
  final Function(int) onItemSelected;
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) => {
        onItemSelected(value),
        context.go(items[value].route),
      },
      destinations: items
          .map((e) => NavigationDestination(
                icon: Icon(e.icon),
                selectedIcon: Icon(e.iconSelected),
                label: e.label,
                tooltip: e.label,
              ))
          .toList(),
    );
  }
}
