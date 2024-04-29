import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/container/container_shadowed.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_default.dart';
import 'package:gallopgate/features/_common/widgets/text/text_card_title.dart';
import 'package:gallopgate/features/_common/widgets/text/text_semi_transparent.dart';
import 'package:iconsax/iconsax.dart';

class HomeAllCoursesCard extends StatelessWidget {
  const HomeAllCoursesCard({super.key});

  @override
  Widget build(BuildContext context) {
    String description = "Lorem ipsum dolor sit amet, consectetur "
        "adipiscing elit, sed do eiusmod tempor"
        " incididunt ut labore et dolore magna aliqua.";

    return ContainerShadowed(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TextCardTitle(text: "My Courses"),
          DefaultSeparator.vertical(),
          _LessonPreview(
            title: "Course 1",
            description: description,
            onPressed: () {},
          ),
          DefaultSeparator.vertical(),
          _LessonPreview(
            title: "Course 2",
            description: description,
            onPressed: () {},
          ),
          DefaultSeparator.vertical(),
          _LessonPreview(
            title: "Course 3",
            description: description,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _LessonPreview extends StatelessWidget {
  const _LessonPreview({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  final String title, description;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2.0,
                horizontal: 5.0,
              ),
              child: SizedBox(
                width: 250,
                child: SemiTransparentText(
                  text: description,
                ),
              ),
            )
          ],
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Iconsax.arrow_right_3),
        )
      ],
    );
  }
}
