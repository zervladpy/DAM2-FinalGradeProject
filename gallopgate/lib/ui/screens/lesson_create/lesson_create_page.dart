import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/lesson_create/widgets/schedule_item.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'bloc/lesson_create_bloc.dart';

class LessonCreatePage extends StatelessWidget {
  const LessonCreatePage(this.organizationId, {super.key});

  static page(String organizationId) => MaterialPage(
          child: LessonCreatePage(
        organizationId,
      ));

  final String organizationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Lesson'),
      ),
      body: BlocProvider(
        create: (_) => LessonCreateBloc(
          organizationId,
          locator.get(),
        ),
        child: const _LessonCreatePage(),
      ),
    );
  }
}

class _LessonCreatePage extends StatelessWidget {
  const _LessonCreatePage();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LessonCreateBloc, LessonCreateState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == Status.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Lesson created successfully'),
            ),
          );
          context.pop();
        } else if (state.status == Status.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text('Failed to create lesson: ${state.error}'),
            ),
          );
        }
      },
      child: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _TitleField(),
              SizedBox(height: 16.0),
              _DescriptionField(),
              SizedBox(height: 16.0),
              _WeekLessonSchedule(),
              SizedBox(height: 16.0),
              _SaveButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeekLessonSchedule extends StatelessWidget {
  const _WeekLessonSchedule();

  @override
  Widget build(BuildContext context) {
    List<String> days = [
      "Monday",
      "Tuesday",
      "Wendsday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];

    return ExpansionPanelList(
      expansionCallback: (index, value) {
        context.read<LessonCreateBloc>().add(LessonTiggerOpen(index));
      },
      children: days.map((day) {
        final dayIndex = days.indexOf(day);

        return ExpansionPanel(
          isExpanded:
              context.watch<LessonCreateBloc>().state.opened.contains(dayIndex),
          headerBuilder: (context, value) {
            return Row(
              children: [
                Switch(
                  value: context
                          .watch<LessonCreateBloc>()
                          .state
                          .enabled[dayIndex] ??
                      false,
                  onChanged: (newValue) {
                    log("toggle open");
                    context
                        .read<LessonCreateBloc>()
                        .add(LessonTriggerEnabled(dayIndex, newValue));
                  },
                ),
                const SizedBox(width: 8.0),
                Text(day)
              ],
            );
          },
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  context
                      .read<LessonCreateBloc>()
                      .add(LessonAddNewScheduleToDay(dayIndex));
                },
                child: const Text("Add Schedule"),
              ),
              ...context
                  .watch<LessonCreateBloc>()
                  .state
                  .lesson
                  .schedules
                  .where((e) {
                return e.weekDay == dayIndex;
              }).map((schedule) {
                return ScheduleItem(item: schedule);
              }),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context.watch<LessonCreateBloc>().state.lesson.title,
      onChanged: (value) =>
          context.read<LessonCreateBloc>().add(LessonTitleChanged(value)),
      decoration: const InputDecoration(
        labelText: 'Title',
        prefixIcon: Icon(Iconsax.text_block),
      ),
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context.watch<LessonCreateBloc>().state.lesson.description,
      onChanged: (value) =>
          context.read<LessonCreateBloc>().add(LessonDescriptionChanged(value)),
      maxLines: 5,
      maxLength: 250,
      decoration: const InputDecoration(
        labelText: 'Description',
      ),
      buildCounter: (
        context, {
        required currentLength,
        required isFocused,
        required maxLength,
      }) {
        return Text('$currentLength/$maxLength');
      },
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      builder: (context, state) {
        bool isLoading = state.status == Status.loading;

        return ElevatedButton(
          onPressed: !isLoading
              ? () => context.read<LessonCreateBloc>().add(const LessonSubmit())
              : null,
          child: const Text('Save'),
        );
      },
    );
  }
}
