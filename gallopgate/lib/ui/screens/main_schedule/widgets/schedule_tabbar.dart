import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/tab_bar/tab_bar.dart';

class ScheduleSliverTabBar extends StatelessWidget {
  const ScheduleSliverTabBar({
    super.key,
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GTabBar(tabs: tabs),
    );
  }
}
