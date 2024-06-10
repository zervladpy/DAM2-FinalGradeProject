import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:iconsax/iconsax.dart';

class SettingsSliverAppbar extends StatelessWidget {
  const SettingsSliverAppbar({
    super.key,
    required this.profile,
    this.notificationCount = 0,
  });

  final Profile profile;
  final int notificationCount;

  @override
  Widget build(BuildContext context) {
    return GSliverAppBar(
      leading: const Icon(Iconsax.user),
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
          const GAppbarTitle('Account'),
          GAppbarSubtitle(profile.fullName),
        ],
      ),
    );
  }
}
