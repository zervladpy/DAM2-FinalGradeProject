import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/models/schedule/schedule.dart';
import 'package:gallopgate/ui/screens/error_not_found/error_not_found_page.dart';
import 'package:gallopgate/ui/screens/lesson_details/bloc/lesson_bloc.dart';
import 'package:gallopgate/ui/screens/loading_page/loading_page.dart';
import 'package:gallopgate/ui/widgets/inputs/time_input_field.dart';

class LessonDetailsPage extends StatelessWidget {
  const LessonDetailsPage(this.lessonId, {super.key});

  final String lessonId;

  static page(String id) => MaterialPage(child: LessonDetailsPage(id));

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LessonBloc(locator.get())
        ..add(
          LessonEventFetch(lessonId),
        ),
      child: const _LessonDetailsPage(),
    );
  }
}

class _LessonDetailsPage extends StatelessWidget {
  const _LessonDetailsPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        if (state.status == LessonStatus.loading) {
          return const LoadingPage();
        }

        if (state.status == LessonStatus.error) {
          return const ErrorNotFoundPage();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(state.lesson.title),
          ),
          body: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _LessonDeescription(),
                  LessonDeails(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LessonDeescription extends StatelessWidget {
  const _LessonDeescription();

  @override
  Widget build(BuildContext context) {
    String description = context.read<LessonBloc>().state.lesson.description;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Description',
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: context.textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class LessonDeails extends StatefulWidget {
  const LessonDeails({super.key});

  @override
  State<LessonDeails> createState() => _LessonDeailsState();
}

class _LessonDeailsState extends State<LessonDeails> {
  Set<int> opendPanels = {};

  void toggleOpen(int index) {
    if (opendPanels.contains(index)) {
      opendPanels.remove(index);
    } else {
      opendPanels.add(index);
    }

    updateState(opendPanels);
  }

  void updateState(Set<int> newOpenedPannels) {
    setState(() {
      opendPanels = newOpenedPannels;
    });
  }

  @override
  Widget build(BuildContext context) {
    final schedules = context.read<LessonBloc>().state.lesson.schedules;

    final List<String> daysOfWeek = [
      "Monday",
      "Tuesday",
      "Wenesday",
      "Thursdaay",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    return ExpansionPanelList(
      expansionCallback: (index, value) {
        toggleOpen(index);
      },
      children: daysOfWeek.map((day) {
        final dayIndex = daysOfWeek.indexOf(day);

        return ExpansionPanel(
          isExpanded: opendPanels.contains(dayIndex),
          headerBuilder: (context, value) {
            return Row(
              children: [
                Switch(value: value, onChanged: (_) => toggleOpen(dayIndex)),
                const SizedBox(width: 16.0),
                Text(day),
              ],
            );
          },
          body: _DayDetails(
            schedules.where((s) => s.weekDay == dayIndex).toList(),
          ),
        );
      }).toList(),
    );
  }
}

class _DayDetails extends StatelessWidget {
  const _DayDetails(this.schedules);

  final List<Schedule> schedules;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ScheduleForm(
          start: DateTime.now(),
          end: DateTime.now().add(
            const Duration(minutes: 30),
          ),
        ),
      ],
    );
  }
}

class _ScheduleForm extends StatelessWidget {
  const _ScheduleForm({
    required this.start,
    required this.end,
  });

  final DateTime start;
  final DateTime end;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TimeInputField(label: 'Start', initialValue: start),
        const SizedBox(width: 16.0),
        TimeInputField(label: 'End', initialValue: end),
      ],
    );
  }
}
