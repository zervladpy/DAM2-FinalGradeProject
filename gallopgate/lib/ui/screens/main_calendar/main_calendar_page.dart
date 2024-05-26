import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/ui/screens/main_calendar/bloc/calendar_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendarPage extends StatelessWidget {
  const MainCalendarPage({super.key});

  static const page = MaterialPage(child: MainCalendarPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main Calendar Page'),
        ),
        body: const _MainCalendarPage(),
      ),
    );
  }
}

class _MainCalendarPage extends StatelessWidget {
  const _MainCalendarPage();

  @override
  Widget build(BuildContext context) {
    final initalDate = DateTime.now();
    final firstDate = DateTime.now().subtract(const Duration(days: 365));
    final lastDate = DateTime.now().add(const Duration(days: 365));

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TableCalendar(
              startingDayOfWeek: StartingDayOfWeek.monday,
              focusedDay: initalDate,
              firstDay: firstDate,
              lastDay: lastDate,
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text("Events: "),
            const SizedBox(height: 8.0),
            const Text("No events")
          ],
        ),
      ),
    );
  }
}
