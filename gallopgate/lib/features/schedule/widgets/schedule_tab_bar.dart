import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/tab_bar/tab.dart';

class ScheduleTabBar extends StatelessWidget implements PreferredSizeWidget {
  const ScheduleTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      isScrollable: true,
      tabs: [
        GTab(
          title: "Monday",
        ),
        GTab(
          title: "Tuesday",
        ),
        GTab(
          title: "Wednesday",
        ),
        GTab(
          title: "Thursday",
        ),
        GTab(
          title: "Friday",
        ),
        GTab(
          title: "Saturday",
        ),
        GTab(
          title: "Sunday",
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.0);
}
