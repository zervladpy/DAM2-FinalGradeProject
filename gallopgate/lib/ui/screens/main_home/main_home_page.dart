import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/ui/widgets/cards/lesson_card.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';

import 'widgets/home_sliver_appbar.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  static const page = MaterialPage(child: MainHomePage());

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<MainBloc>().state.profile;
    final organization = context.watch<MainBloc>().state.organization;

    final lessons = context.watch<MainBloc>().state.lessons;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<MainBloc>().add(MainEventInitialize(profile.id));
        },
        child: CustomScrollView(
          slivers: [
            HomeSliverAppbar(profile: profile, organization: organization),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (lessons.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            'Upcoming lesson',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 16),
                          LessonCard(
                            lesson: upcomig(lessons)!,
                            profile: profile,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Lesson? upcomig(List<Lesson> items) {
    final now = DateTime.now();
    Lesson? closestLesson;
    Duration? shortestDuration;

    for (var lesson in items) {
      if (lesson.startAt == null) continue;

      final nowWeekday = now.weekday;
      final nowTime = Duration(
        hours: now.hour,
        minutes: now.minute,
        seconds: now.second,
      );

      final lessonTime = Duration(
        hours: lesson.startAt!.hour,
        minutes: lesson.startAt!.minute,
        seconds: lesson.startAt!.second,
      );

      int dayDifference = (lesson.weekday - nowWeekday + 7) % 7;
      if (dayDifference == 0 && lessonTime < nowTime) {
        dayDifference = 7;
      }

      final durationUntilLesson =
          Duration(days: dayDifference) + (lessonTime - nowTime);

      if (shortestDuration == null || durationUntilLesson < shortestDuration) {
        closestLesson = lesson;
        shortestDuration = durationUntilLesson;
      }
    }

    return closestLesson;
  }
}
