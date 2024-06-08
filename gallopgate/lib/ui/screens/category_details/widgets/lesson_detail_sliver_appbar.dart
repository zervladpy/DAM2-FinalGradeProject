import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';

class LessonDetailSliverAppbar extends StatelessWidget {
  const LessonDetailSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const GSliverAppBar(
      title: Text('Lesson Details'),
    );
  }
}
