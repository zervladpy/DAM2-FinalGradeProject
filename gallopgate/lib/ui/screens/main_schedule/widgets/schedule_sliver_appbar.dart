import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/router/router.library.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/buttons/g_icon_button.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:iconsax/iconsax.dart';

class ScheduleSliverAppbar extends StatelessWidget {
  const ScheduleSliverAppbar({
    super.key,
    required this.organization,
    this.notificationCount = 0,
    this.isAdimin = false,
  });

  final Organization organization;
  final int notificationCount;
  final bool isAdimin;

  @override
  Widget build(BuildContext context) {
    return GSliverAppBar(
      leading: const Icon(Iconsax.calendar_1),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Badge(
            isLabelVisible: notificationCount > 0,
            label: notificationCount > 0
                ? Text(notificationCount.toString())
                : null,
            child: const GIconButton(
              icon: Iconsax.notification,
            ),
          ),
        ),
        if (isAdimin)
          GIconButton.filled(
            icon: Iconsax.add,
            onPressed: () {
              context.push('/managment/lessons/create');
            },
          ),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GAppbarTitle('Schedule'),
          GAppbarSubtitle(organization.name),
        ],
      ),
    );
  }
}
