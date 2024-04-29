import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/container/container_shadowed.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_default.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_small.dart';
import 'package:gallopgate/features/_common/widgets/text/text_card_title.dart';
import 'package:iconsax/iconsax.dart';

class HomeNextLessonCard extends StatelessWidget {
  const HomeNextLessonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerShadowed(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TextCardTitle(text: "Upcoming Lesson"),
          DefaultSeparator.vertical(),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Icon(Iconsax.clock),
                      SmallSeparator.horizontal(),
                      Text(
                        "Saturday, 24 April at 10:25",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ],
              ),
              DefaultSeparator.vertical(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Icon(Iconsax.book),
                      SmallSeparator.horizontal(),
                      Text(
                        "Course 1",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ],
              ),
              DefaultSeparator.vertical(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Icon(Iconsax.teacher),
                      SmallSeparator.horizontal(),
                      Text(
                        "John Doe",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ],
              ),
              DefaultSeparator.vertical(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Icon(Iconsax.truck_fast),
                      SmallSeparator.horizontal(),
                      Text(
                        "Sam Du Halage",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ],
              ),
              DefaultSeparator.vertical(),
              ElevatedButton(
                onPressed: () {
                  // TODO: Add Go to lesson preview
                },
                child: const Text("See More"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
