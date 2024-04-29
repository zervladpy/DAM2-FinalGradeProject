import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/logo/logo.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_small.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // --- Logo --- //
        const GLogo(),
        SmallSeparator.horizontal(),
        // ---App Name and Small page description --- //
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "GallopGate",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SmallSeparator.vertical(),
            Text(
              "Welcome Back!",
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        )
      ],
    );
  }
}
