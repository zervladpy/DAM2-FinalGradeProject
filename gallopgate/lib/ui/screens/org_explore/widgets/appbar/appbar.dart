import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/buttons/g_icon_button.dart';
import 'package:gallopgate/ui/widgets/image/logo_image.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:iconsax/iconsax.dart';

class OrgExploreAppbar extends StatelessWidget {
  const OrgExploreAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GSliverAppBar(
      leading: const LogoImage(
        height: 20,
        width: 20,
      ),
      actions: [
        GIconButton(
          onPressed: () {},
          icon: Iconsax.notification,
        )
      ],
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GAppbarTitle('Explore Organizations'),
          GAppbarSubtitle('GallopGate'),
        ],
      ),
    );
  }
}
