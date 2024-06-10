import 'package:flutter/material.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';

class LessonCreateSliverAppbar extends StatelessWidget {
  const LessonCreateSliverAppbar({
    super.key,
    required this.organization,
  });

  final Organization organization;

  @override
  Widget build(BuildContext context) {
    return GSliverAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GAppbarTitle('Create Lesson'),
          GAppbarSubtitle(organization.name),
        ],
      ),
    );
  }
}
