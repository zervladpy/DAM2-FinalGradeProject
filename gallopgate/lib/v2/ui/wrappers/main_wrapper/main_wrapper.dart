import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gallopgate/v2/ui/widgets/navigation/bottom_navigation.dart';
import 'package:gallopgate/v2/ui/widgets/navigation/lateral_navigation.dart';
import 'package:gallopgate/v2/ui/widgets/navigation/navigation_item.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({
    super.key,
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  late int selectedIndex = 0;

  void setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final useNavigationRail = MediaQuery.of(context).size.width > 600;
    final navigationItems = _navigationItems(true);

    int index = navigationItems.indexOf(
      navigationItems.firstWhere(
        (element) {
          log(widget.state.matchedLocation.toString());
          return element.route == widget.state.matchedLocation;
        },
        orElse: () => navigationItems.first,
      ),
    );

    setIndex(index);

    return Scaffold(
      body: Row(
        children: [
          if (useNavigationRail)
            LateralNavigation(
              onItemSelected: setIndex,
              selectedIndex: selectedIndex,
              items: navigationItems,
            ),
          Expanded(
            child: FadeTransition(
              opacity: const AlwaysStoppedAnimation(1),
              child: widget.child,
            ),
          )
        ],
      ),
      bottomNavigationBar: useNavigationRail
          ? null
          : BottomNavigation(
              onItemSelected: setIndex,
              selectedIndex: selectedIndex,
              items: navigationItems,
            ),
    );
  }

  List<NavigationItem> _navigationItems(bool isAdmin) {
    return [
      const NavigationItem(
        label: "Home",
        icon: Iconsax.home,
        iconSelected: Iconsax.home,
        route: '/home',
      ),
      const NavigationItem(
        label: "Calendar",
        icon: Iconsax.calendar,
        iconSelected: Iconsax.calendar,
        route: '/calendar',
      ),
      const NavigationItem(
        label: "Schedule",
        icon: Iconsax.calendar_1,
        iconSelected: Iconsax.calendar_1,
        route: '/schedule',
      ),
      if (isAdmin)
        const NavigationItem(
          label: "Manage",
          icon: Iconsax.setting_3,
          iconSelected: Iconsax.setting_3,
          route: '/management',
        ),
      const NavigationItem(
        label: "Account",
        icon: Iconsax.user,
        iconSelected: Iconsax.user,
        route: '/account',
      ),
    ];
  }
}
