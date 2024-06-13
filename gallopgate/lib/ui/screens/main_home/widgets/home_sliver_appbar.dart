import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:iconsax/iconsax.dart';

class HomeSliverAppbar extends StatelessWidget {
  const HomeSliverAppbar({
    super.key,
    required this.profile,
    required this.organization,
    this.notificationCount = 0,
  });

  final Profile profile;
  final Organization organization;
  final int notificationCount;

  @override
  Widget build(BuildContext context) {
    return GSliverAppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Iconsax.user,
          color: GColor.primaryLight,
        ),
      ),
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
          GAppbarTitle(profile.fullName),
          GAppbarSubtitle(organization.name),
        ],
      ),
    );
  }
}
