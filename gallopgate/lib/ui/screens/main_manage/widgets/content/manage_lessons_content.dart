import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/models/lesson/lesson_preview_dto.dart';
import 'package:gallopgate/ui/screens/main_manage/bloc/manage_bloc.dart';
import 'package:gallopgate/ui/screens/main_manage/widgets/buttons/manage_add_button.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';

class ManageLessonsContent extends StatelessWidget {
  const ManageLessonsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<ManageBloc, ManageState>(
          buildWhen: (prev, curr) => prev.lessons != curr.lessons,
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.lessons.length,
              itemBuilder: (context, index) {
                LessonPreviewDto previewDto = state.lessons.elementAt(index);
                return _LessonCard(previewDto);
              },
            );
          },
        ),
        const _AddLessonButton(),
      ],
    );
  }
}

class _LessonCard extends StatelessWidget {
  const _LessonCard(this.lesson);

  final LessonPreviewDto lesson;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      child: ListTile(
        title: Text(lesson.title),
        onTap: () {
          context.push('/lessons/${lesson.id}');
        },
      ),
    );
  }
}

class _AddLessonButton extends StatelessWidget {
  const _AddLessonButton();

  @override
  Widget build(BuildContext context) {
    final orgainzationId = context.read<MainBloc>().state.organization.id;

    return AddButton(
      label: "Add lesson",
      onPressed: () {
        context.push('/lessons/create', extra: {
          "organizationId": orgainzationId,
        });
      },
    );
  }
}
