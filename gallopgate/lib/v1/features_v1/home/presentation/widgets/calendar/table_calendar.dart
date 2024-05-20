import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class GTableCalendar extends StatelessWidget {
  const GTableCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(2024),
      lastDay: DateTime(DateTime.now().year + 2),
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
      ),
    );
  }
}
