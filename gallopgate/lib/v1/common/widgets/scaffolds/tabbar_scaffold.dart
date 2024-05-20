import 'package:flutter/material.dart';

class TabbarScaffold extends StatelessWidget {
  const TabbarScaffold({
    super.key,
    required this.tabs,
    required this.pages,
    this.appBar,
    this.initialIndex,
  });

  final int? initialIndex;
  final AppBar? appBar;
  final List<Tab> tabs;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    assert(tabs.length == pages.length);

    return DefaultTabController(
      length: tabs.length,
      initialIndex: initialIndex ?? 0,
      child: Scaffold(
        appBar: appBar,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  tabs: tabs,
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: TabBarView(
                  children: pages,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
