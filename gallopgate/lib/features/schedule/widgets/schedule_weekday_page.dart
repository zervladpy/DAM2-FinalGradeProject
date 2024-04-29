import 'package:flutter/material.dart';
import 'package:gallopgate/features/schedule/domain/models/LecturePreview.dart';
import 'package:gallopgate/features/schedule/widgets/schedule_list_tile_lecture.dart';

class ScheduleWeekdayPage extends StatelessWidget {
  const ScheduleWeekdayPage({super.key, required this.previews});

  final List<LecturePreview> previews;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: previews.length,
      itemBuilder: (context, index) {
        return ScheduleListTileLecture(lecture: previews[index]);
      },
    );
  }
}
