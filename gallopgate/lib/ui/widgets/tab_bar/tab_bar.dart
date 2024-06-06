import 'package:flutter/material.dart';

class GTabBar extends StatelessWidget implements PreferredSizeWidget {
  const GTabBar({
    super.key,
    required this.tabs,
    this.alignment = TabAlignment.start,
    this.scrollable = true,
  });

  final TabAlignment alignment;
  final bool scrollable;
  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    assert(tabs.length > 2, 'TabBar must have at least 2 tabs');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TabBar(
        tabAlignment: alignment,
        isScrollable: scrollable,
        tabs: tabs.map((t) => Tab(text: t, height: 35.0)).toList(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40.0);
}
