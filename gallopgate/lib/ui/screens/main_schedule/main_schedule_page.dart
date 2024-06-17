import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/common/utils/role_utils.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/ui/router/router.library.dart';
import 'package:gallopgate/ui/screens/main_schedule/bloc/schedule_bloc.dart';
import 'package:gallopgate/ui/screens/main_schedule/widgets/schedule_sliver_appbar.dart';
import 'package:gallopgate/ui/screens/main_schedule/widgets/schedule_tabbar.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:iconsax/iconsax.dart';

class MainSchedulePage extends StatelessWidget {
  const MainSchedulePage({super.key});

  static get page => const MaterialPage(child: MainSchedulePage());

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();

    return BlocProvider(
      create: (_) => ScheduleBloc(
        lessonRepository: locator.get(),
        profile: bloc.state.profile,
      )..add(Fetch()),
      child: const _MainSchedulePage(),
    );
  }
}

class _MainSchedulePage extends StatelessWidget {
  const _MainSchedulePage({super.key});

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

    final bloc = context.read<MainBloc>();

    final initialDay = DateTime.now().weekday - 1;
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ScheduleBloc>().add(Fetch());
      },
      child: DefaultTabController(
        length: days.length,
        initialIndex: initialDay,
        child: CustomScrollView(
          slivers: [
            ScheduleSliverAppbar(
              organization: bloc.state.organization,
              isAdimin: GRolesUtils.isAdmin(bloc.state.profile.roles),
            ),
            const _LoadingIndicator(),
            ScheduleSliverTabBar(tabs: days),
            SliverFillRemaining(
              child: BlocBuilder<ScheduleBloc, ScheduleState>(
                buildWhen: (previous, current) =>
                    previous.lessons != current.lessons,
                builder: (context, state) {
                  return TabBarView(
                    children: List.generate(
                      days.length,
                      (i) => WeekDaySchedulePage(
                        lessons: _getLessonsByDay(state.lessons, i),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Lesson> _getLessonsByDay(List<Lesson> lessons, int day) {
    return lessons.where((l) => l.weekday == day).toList();
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      sliver: BlocBuilder<ScheduleBloc, ScheduleState>(
        builder: (context, state) {
          if (state.status != Status.loading) return const SliverToBoxAdapter();
          return const SliverLinearLoading();
        },
      ),
    );
  }
}

class WeekDaySchedulePage extends StatelessWidget {
  const WeekDaySchedulePage({
    super.key,
    this.lessons = const [],
  });

  final List<Lesson> lessons;

  @override
  Widget build(BuildContext context) {
    lessons.sort((a, b) => a.startAt!.compareTo(b.startAt!));

    return ListView.builder(
      itemCount: lessons.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return _LessonListTile(lesson: lesson);
      },
    );
  }
}

class _LessonListTile extends StatelessWidget {
  const _LessonListTile({
    super.key,
    required this.lesson,
  });

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
    final String start = GDateUtils.formatTimeToString(lesson.startAt!);
    final String end = GDateUtils.formatTimeToString(lesson.startAt!.add(
      Duration(minutes: lesson.duration),
    ));

    return InkWell(
      onTap: () {
        context.push('/managment/lessons/${lesson.id}');
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: GColor.surfaceDark.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: Text(
                        start,
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      decoration: BoxDecoration(
                        color: GColor.surfaceDark.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      child: Text(
                        end,
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GAppbarTitle(lesson.title),
                    GAppbarSubtitle(lesson.category.title)
                  ],
                ),
              ],
            ),
            const Column(
              children: [
                Icon(Iconsax.book_1),
              ],
            )
          ],
        ),
      ),
    );
  }
}
