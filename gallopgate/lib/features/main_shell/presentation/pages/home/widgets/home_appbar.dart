import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../_common/widgets/appbar.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GAppBar(
      title: const Text('Hi, John Doe!'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.notification),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const GAppBar().preferredSize;
}
