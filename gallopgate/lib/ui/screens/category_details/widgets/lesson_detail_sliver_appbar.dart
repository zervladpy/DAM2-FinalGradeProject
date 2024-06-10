import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';

class LessonDetailSliverAppbar extends StatelessWidget {
  const LessonDetailSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const GSliverAppBar(
      title: GAppbarTitle('Category Details'),
    );
  }
}
