import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class OrganizationSliverAppbar extends StatelessWidget {
  const OrganizationSliverAppbar({
    super.key,
    required this.organization,
    this.isAdmin = false,
  });

  final Organization organization;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    final canPop = context.canPop();

    return GSliverAppBar(
      leading: canPop
          ? IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(
                Iconsax.arrow_left_2,
                color: GColor.primaryLight,
              ),
            )
          : null,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GAppbarTitle('Organization'),
          GAppbarSubtitle(organization.name),
        ],
      ),
    );
  }
}
