import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:iconsax/iconsax.dart';

import '../../../widgets/buttons/g_icon_button.dart';

class CalendarSliverAppbar extends StatelessWidget {
  const CalendarSliverAppbar({
    super.key,
    required this.organization,
    this.notificationCount = 0,
    this.isAdmin = false,
  });

  final Organization organization;
  final int notificationCount;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return GSliverAppBar(
      leading: const Icon(Iconsax.calendar),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge(
            isLabelVisible: notificationCount > 0,
            label: notificationCount > 0
                ? Text(notificationCount.toString())
                : null,
            child: const Icon(
              Iconsax.notification,
              color: GColor.primaryLight,
            ),
          ),
        ),
        const GIconButton.filled(icon: Iconsax.add),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GAppbarTitle('Calendar'),
          GAppbarSubtitle(organization.name),
        ],
      ),
    );
  }
}
