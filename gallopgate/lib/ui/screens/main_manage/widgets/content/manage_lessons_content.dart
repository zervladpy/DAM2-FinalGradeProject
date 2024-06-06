import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/models/lesson/lesson.dart';
import 'package:gallopgate/ui/screens/loading_page/loading_page.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../manage_top_bar.dart';

class ManageLessonsContent extends StatelessWidget {
  const ManageLessonsContent({
    super.key,
    required this.fetch,
  });

  final Future<List<Lesson>> Function() fetch;

  @override
  Widget build(BuildContext context) {
    final orgainzationId = context.read<MainBloc>().state.organization.id;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final lessons = snapshot.data as List<Lesson>;

          return ListView(
            primary: true,
            children: [
              ManageTopBar(
                count: lessons.length,
                onAddPressed: () {
                  context.push(
                    '/lessons/create',
                    extra: {'organization-id': orgainzationId},
                  );
                },
              ),
              const SizedBox(height: 16),
              _LessonListView(lessons: lessons),
            ],
          );
        },
      ),
    );
  }
}

class _LessonListView extends StatelessWidget {
  const _LessonListView({
    super.key,
    required this.lessons,
  });

  final List<Lesson> lessons;

  @override
  Widget build(BuildContext context) {
    void navigateToHorseDetail(String id) {
      context.push('/lessons/$id');
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: lessons.length,
      separatorBuilder: (context, index) => const SizedBox(height: 5.0),
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return _LessonListTile(lesson: lesson, onTap: navigateToHorseDetail);
      },
    );
  }
}

class _LessonListTile extends StatelessWidget {
  const _LessonListTile({super.key, required this.lesson, this.onTap});

  final Lesson lesson;
  final void Function(String id)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(lesson.title),
      subtitle: Text(lesson.description),
      leading: const CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Icon(Iconsax.book),
      ),
      onTap: () => onTap?.call(lesson.id),
    );
  }
}
