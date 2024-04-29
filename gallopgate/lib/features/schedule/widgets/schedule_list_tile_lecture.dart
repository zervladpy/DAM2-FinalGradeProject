import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/list_tile/list_tile.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_small.dart';
import 'package:gallopgate/features/_common/widgets/text/text.dart';
import 'package:gallopgate/features/_common/widgets/text/text_semi_transparent.dart';
import 'package:gallopgate/features/schedule/domain/models/LecturePreview.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';

class ScheduleListTileLecture extends StatelessWidget {
  const ScheduleListTileLecture({super.key, required this.lecture});

  final LecturePreview lecture;

  @override
  Widget build(BuildContext context) {
    return GListTile(
      title: lecture.title,
      subtitle: Padding(
        padding: EdgeInsets.symmetric(vertical: GSizes.separationSm),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 75.0,
                  child: GText(text: "Start Time"),
                ),
                SmallSeparator.vertical(),
                SizedBox(
                  width: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SemiTransparentText(
                        text: lecture.startTime,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SmallSeparator.horizontal(),
            Row(
              children: [
                const SizedBox(
                  width: 75.0,
                  child: GText(text: "Duration"),
                ),
                SmallSeparator.vertical(),
                SizedBox(
                  width: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SemiTransparentText(
                        text: lecture.duration,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
