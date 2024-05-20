import 'package:flutter/material.dart';
import 'package:gallopgate/v1/common/widgets/scaffolds/tabbar_scaffold.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return TabbarScaffold(
      initialIndex: DateTime.now().weekday - 1,
      appBar: AppBar(
        title: const Text("Schedule"),
      ),
      tabs: const [
        Tab(text: "Monday"),
        Tab(text: "Tuesday"),
        Tab(text: "Wednesday"),
        Tab(text: "Thursday"),
        Tab(text: "Friday"),
        Tab(text: "Saturday"),
        Tab(text: "Sunday"),
      ],
      pages: const [
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
      ],
    );
  }
}

class _ScheduleScreen extends StatelessWidget {
  const _ScheduleScreen();

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
        Placeholder(),
      ],
    );
  }
}
