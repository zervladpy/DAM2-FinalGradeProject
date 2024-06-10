import 'package:flutter/material.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/buttons/g_icon_button.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ManageLessonsSliverAppabar extends StatelessWidget {
  const ManageLessonsSliverAppabar({
    super.key,
    required this.organization,
  });

  final Organization organization;

  @override
  Widget build(BuildContext context) {
    return GSliverAppBar(
      actions: [
        GIconButton.filled(
          icon: Iconsax.add,
          onPressed: () => context.push('/managment/lessons/create'),
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GAppbarTitle('Manage Lessons'),
          GAppbarSubtitle(organization.name),
        ],
      ),
    );
  }
}
