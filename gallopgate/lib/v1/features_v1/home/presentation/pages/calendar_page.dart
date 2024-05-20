import 'package:flutter/material.dart';
import 'package:gallopgate/v1/config/extension/double.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/widgets/calendar/table_calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
      ),
      body: const _CalnedarPage(),
    );
  }
}

class _CalnedarPage extends StatelessWidget {
  const _CalnedarPage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.0.paddingAll,
      child: const GTableCalendar(),
    );
  }
}
