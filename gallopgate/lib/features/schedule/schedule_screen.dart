import 'package:flutter/material.dart';
import 'package:gallopgate/features/schedule/domain/models/LecturePreview.dart';
import 'package:gallopgate/features/schedule/widgets/schedule_appbar.dart';
import 'package:gallopgate/features/schedule/widgets/schedule_page.dart';
import 'package:gallopgate/features/schedule/widgets/schedule_weekday_page.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  static Page<ScheduleScreen> get page =>
      const MaterialPage(child: ScheduleScreen());

  @override
  Widget build(BuildContext context) {
    final List<Widget> weekDayPages = [
      const ScheduleWeekdayPage(
          previews: [LecturePreview("1", "Galop", "10:00", "45")]),
      const ScheduleWeekdayPage(previews: []),
      const ScheduleWeekdayPage(previews: []),
      const ScheduleWeekdayPage(previews: []),
      const ScheduleWeekdayPage(previews: []),
      const ScheduleWeekdayPage(previews: []),
      const ScheduleWeekdayPage(previews: []),
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: weekDayPages.length,
      child: Scaffold(
        appBar: const ScheduleAppbar(),
        body: SchedulePage(
          weekDayPages: weekDayPages,
        ),
      ),
    );
  }
}
