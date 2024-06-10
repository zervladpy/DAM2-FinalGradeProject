import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:iconsax/iconsax.dart';

class ManageSliverAppbar extends StatelessWidget {
  const ManageSliverAppbar({
    super.key,
    required this.organization,
    this.notificationCount = 0,
  });

  final Organization organization;
  final int notificationCount;

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
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GAppbarTitle('Manage'),
          GAppbarSubtitle(organization.name),
        ],
      ),
    );
  }
}
