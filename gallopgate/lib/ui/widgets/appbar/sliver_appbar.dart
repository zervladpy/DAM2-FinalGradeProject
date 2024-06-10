import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class GSliverAppBar extends StatelessWidget {
  const GSliverAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final canPop = context.canPop();
    return SliverAppBar.medium(
      leading: canPop && leading == null ? const _BackArrow() : leading,
      actions: [
        if (actions != null)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [...actions!],
            ),
          )
      ],
      title: title,
    );
  }
}

class _BackArrow extends StatelessWidget {
  const _BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(
        Iconsax.arrow_left_2,
        color: GColor.primaryLight,
      ),
    );
  }
}
