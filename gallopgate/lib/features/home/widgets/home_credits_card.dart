import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/button/elevated_button_icon.dart';
import 'package:gallopgate/features/_common/widgets/container/container_shadowed.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_small.dart';
import 'package:iconsax/iconsax.dart';

class HomeCreditsCard extends StatelessWidget {
  const HomeCreditsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerShadowed(
      child: Row(
        children: [
          // --- Title --- //
          Column(
            children: [
              Text(
                'Credits',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SmallSeparator.vertical(),
              Row(
                children: [
                  const Icon(Iconsax.coin),
                  SmallSeparator.horizontal(),
                  // --- Amount of credits  --- //
                  Text(
                    "100",
                    style: Theme.of(context).textTheme.headlineLarge,
                  )
                ],
              )
            ],
          ),

          const Spacer(),
          // --- Add Button --- //
          ElevatedButtonIcon(
            icon: Iconsax.add,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
