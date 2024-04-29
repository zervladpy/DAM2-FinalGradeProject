import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/list_tile/list_tile.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_small.dart';
import 'package:gallopgate/features/_common/widgets/text/text_semi_transparent.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:gallopgate/utils/helper/helper.dart';
import 'package:iconsax/iconsax.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = GHelper.isDarkMode(context);

    return GListTile(
      leading: CircleAvatar(
        backgroundColor:
            isDarkMode ? GColor.darkBackground : GColor.lightBackground,
        child: const Icon(Iconsax.user),
      ),
      title: "Contact Name",
      subtitle: Row(
        children: [
          const SemiTransparentText(
            text: "12:00",
          ),
          SmallSeparator.horizontal(),
          const SemiTransparentText(
            text: "Join the premium community now",
          ),
        ],
      ),
      trailing: const Badge(
        isLabelVisible: true,
        smallSize: 10,
      ),
      onTap: () {},
    );
  }
}
