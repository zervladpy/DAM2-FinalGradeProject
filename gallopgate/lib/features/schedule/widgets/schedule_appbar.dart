import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/appbar/appbar.dart';
import 'package:gallopgate/features/schedule/widgets/schedule_tab_bar.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:iconsax/iconsax.dart';

class ScheduleAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ScheduleAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GAppBar(
      title: const Text("Schedule"),
      bottom: const ScheduleTabBar(),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.calendar),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(GSizes.appbarWithTabHeight);
}
