import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/appbar/appbar.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GAppBar(
      title: const Text("Notifications"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Iconsax.search_normal_1),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(GSizes.appbarHeight);
}
