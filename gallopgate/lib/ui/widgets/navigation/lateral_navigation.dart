import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/navigation/navigation_item.dart';
import 'package:go_router/go_router.dart';

class LateralNavigation extends StatelessWidget {
  const LateralNavigation({
    super.key,
    required this.items,
    required this.onItemSelected,
    required this.selectedIndex,
  });

  final List<NavigationItem> items;
  final int selectedIndex;
  final Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) => {
        onItemSelected(value),
        context.go(items[value].route),
      },
      labelType: NavigationRailLabelType.selected,
      destinations: items
          .map((e) => NavigationRailDestination(
                icon: Icon(e.icon),
                selectedIcon: Icon(e.iconSelected),
                label: Text(e.label),
              ))
          .toList(),
    );
  }
}
