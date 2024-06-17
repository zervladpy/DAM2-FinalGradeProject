import 'package:flutter/material.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/models/lesson_member/lesson_member.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LessonCard extends StatelessWidget {
  const LessonCard({
    super.key,
    required this.lesson,
    this.profile,
  });

  final Lesson lesson;
  final Profile? profile;

  @override
  Widget build(BuildContext context) {
    final List<String> days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    final member = getMemeber(profile!, lesson.lessonMembers);

    return Container(
      decoration: const BoxDecoration(),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lesson.title,
                style: context.textTheme.titleMedium,
              ),
              Chip(
                backgroundColor: GColor.primaryLight,
                side: BorderSide.none,
                label: Text(
                  lesson.category.title,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: GColor.surfaceLight,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Iconsax.calendar,
              ),
              const SizedBox(width: 8),
              Text(
                days.elementAt(lesson.weekday),
                style: context.textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Iconsax.clock,
              ),
              const SizedBox(width: 8),
              Text(
                GDateUtils.formatTimeToString(lesson.startAt!),
                style: context.textTheme.bodyLarge,
              ),
              SizedBox(
                width: 16,
                child: Center(
                  child: Text('-', style: context.textTheme.bodyLarge),
                ),
              ),
              Text(
                GDateUtils.formatTimeToString(lesson.startAt!.add(
                  Duration(minutes: lesson.duration),
                )),
                style: context.textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              const Icon(Iconsax.teacher),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                '${lesson.instructor.firstName} ${lesson.instructor.lastName}',
                style: context.textTheme.bodyLarge,
              )
            ],
          ),
          const SizedBox(height: 16),
          if (member != null)
            Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Iconsax.user,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${member.profile.firstName} ${member.profile.lastName}',
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(
                      Iconsax.activity,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      member.horse.alias ?? member.horse.fullName,
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ElevatedButton(
            onPressed: () {
              context.push('/managment/lessons/${lesson.id}');
            },
            child: const Text('See More'),
          )
        ],
      ),
    );
  }

  LessonMember? getMemeber(
    Profile profile,
    List<LessonMember> members,
  ) {
    for (var member in members) {
      if (member.profile.id == profile.id) {
        return member;
      }
    }

    return null;
  }
}
