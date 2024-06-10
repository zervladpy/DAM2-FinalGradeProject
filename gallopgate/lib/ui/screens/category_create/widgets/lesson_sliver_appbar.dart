import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LessonSliverAppbar extends StatelessWidget {
  const LessonSliverAppbar({
    super.key,
    required this.organization,
  });

  final Organization organization;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GAppbarTitle('Create new Category'),
          GAppbarSubtitle(organization.name),
        ],
      ),
    );
  }
}
