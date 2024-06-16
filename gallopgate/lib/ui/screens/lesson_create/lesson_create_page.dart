import 'dart:developer';

import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/models/lesson_category/lesson_category.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/ui/router/router.library.dart';
import 'package:gallopgate/ui/screens/lesson_create/bloc/bloc/lesson_create_bloc.dart';
import 'package:gallopgate/ui/screens/lesson_create/library.dart';
import 'package:gallopgate/ui/screens/org_create/library.dart';
import 'package:gallopgate/ui/widgets/inputs/text_field/text_form_filed.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:iconsax/iconsax.dart';

class LessonCreatePage extends StatelessWidget {
  const LessonCreatePage({super.key});

  static get page => const MaterialPage(child: LessonCreatePage());

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MainBloc>();
    final organization = bloc.state.organization;
    final creator = bloc.state.profile;

    return Scaffold(
      body: BlocProvider(
        create: (_) => LessonCreateBloc(
          organization: organization,
          creator: creator,
          lessonRepository: locator.get(),
          profileRepository: locator.get(),
          lessonCategoryRepository: locator.get(),
        )..add(const Fetch()),
        child: Builder(
          builder: (context) {
            return BlocListener<LessonCreateBloc, LessonCreateState>(
              listenWhen: (prev, curr) => prev.status != curr.status,
              listener: (context, state) {
                if (state.status == Status.success) {
                  GSnackbar.success(
                    context: context,
                    message: 'Lesson ${state.lesson.title} successfully',
                  );

                  context.replace('/managment/lessons/${state.lesson.id}');
                }

                if (state.status == Status.error) {
                  log(state.error);
                  GSnackbar.error(
                    context: context,
                    message: state.error,
                  );
                }
              },
              child: const _Content(),
            );
          },
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    final organization = context.watch<MainBloc>().state.organization;

    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            LessonCreateSliverAppbar(organization: organization),
            const _LoadingBar(),
            if (state.status != Status.loading)
              const SliverPadding(
                padding: EdgeInsets.all(16.0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _TitleField(),
                      SizedBox(height: 16.0),
                      _CategoryField(),
                      SizedBox(height: 16.0),
                      _InstructorSelect(),
                      SizedBox(height: 16.0),
                      _StartTime(),
                      SizedBox(height: 16.0),
                      _Duration(),
                      SizedBox(height: 16.0),
                      _WeekDaySelection(),
                      SizedBox(height: 16.0),
                      _CreateLessonButton(),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _LoadingBar extends StatelessWidget {
  const _LoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        return switch (state.status) {
          Status.loading => const SliverLinearLoading(),
          _ => const SliverToBoxAdapter(child: SizedBox.shrink()),
        };
      },
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LessonCreateBloc>();

    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      buildWhen: (prev, curr) => prev.lesson.title != curr.lesson.title,
      builder: (context, state) {
        return GTextFormField(
          initialValue: state.lesson.title,
          enabled: true,
          onChanged: (value) => bloc.add(TitleChanged(title: value)),
          validator: validator,
          prefixIcon: Iconsax.activity,
        );
      },
    );
  }

  String? validator(String? value) {
    if (value == null) return 'required';
    if (value.isEmpty) return 'required';
    return null;
  }
}

class _CategoryField extends StatelessWidget {
  const _CategoryField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LessonCreateBloc>();

    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      buildWhen: (prev, curr) {
        if (prev.lesson.category != curr.lesson.category) {
          return true;
        }

        if (prev.categories != curr.categories) {
          return true;
        }

        return false;
      },
      builder: (context, state) {
        return DropdownButtonFormField<LessonCategory>(
          decoration: const InputDecoration(
            labelText: 'Category',
          ),
          onChanged: (value) => bloc.add(CategoryChanged(
            category: value ?? LessonCategory.empty,
          )),
          items: state.categories.map((category) {
            return DropdownMenuItem(
              value: category,
              child: Row(
                children: [
                  const Icon(Iconsax.category),
                  const SizedBox(width: 16.0),
                  Text(category.title),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _InstructorSelect extends StatelessWidget {
  const _InstructorSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<LessonCreateBloc>();

    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      builder: (context, state) {
        return DropdownButtonFormField<Profile>(
          decoration: const InputDecoration(
            labelText: 'Instructor',
          ),
          onChanged: (value) => bloc.add(InstructorChanged(
            instructor: value ?? Profile.empty,
          )),
          items: state.instructors.map((v) {
            return DropdownMenuItem(
              value: v,
              child: Row(
                children: [
                  const Icon(Iconsax.category),
                  const SizedBox(width: 16.0),
                  Text(v.fullName),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _CreateLessonButton extends StatelessWidget {
  const _CreateLessonButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        final isEnabled = state.status != Status.loading;
        final isLoading = state.status == Status.loading;

        return ElevatedButton(
          onPressed: isEnabled && !isLoading
              ? () => context.read<LessonCreateBloc>().add(const Submit())
              : null,
          child: const Text("Create"),
        );
      },
    );
  }
}

class _StartTime extends StatelessWidget {
  const _StartTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      buildWhen: (prev, curr) => prev.lesson.startAt != curr.lesson.startAt,
      builder: (context, state) {
        final hours = state.lesson.startAt?.hour;
        final minutes = state.lesson.startAt?.minute;
        return ListTile(
          leading: const Icon(Iconsax.clock),
          contentPadding: const EdgeInsets.all(0),
          title: const Text("Start at"),
          onTap: () => _showTimeWidget(context, (date) {
            context.read<LessonCreateBloc>().add(StartAtChanged(startAt: date));
          }),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.lesson.startAt != null
                    ? '$hours:$minutes'
                    : GDateUtils.formatTimeToString(DateTime.now()),
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(width: 8.0),
              const Icon(Iconsax.arrow_right_3),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showTimeWidget(
    BuildContext context,
    Function(DateTime)? setStartTime,
  ) async {
    final now = DateTime.now();

    final time = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
    );

    if (time != null && setStartTime != null) {
      final date = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );

      setStartTime(date);
    }
  }
}

class _Duration extends StatelessWidget {
  const _Duration({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      buildWhen: (prev, curr) => prev.lesson.duration != curr.lesson.duration,
      builder: (context, state) {
        final hours = state.lesson.duration ~/ 60;
        final minutes = state.lesson.duration % 60;

        return ListTile(
          leading: const Icon(Iconsax.clock),
          title: const Text("Duration"),
          contentPadding: const EdgeInsets.all(0),
          onTap: () => _showTimeWidget(context, (date) {
            context
                .read<LessonCreateBloc>()
                .add(DurationChanged(duration: date));
          }),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.lesson.duration != 0
                    ? '$hours:$minutes'
                    : GDateUtils.formatTimeToString(DateTime.now()),
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(width: 8.0),
              const Icon(Iconsax.arrow_right_3),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showTimeWidget(
    BuildContext context,
    Function(int)? setDuration,
  ) async {
    final time = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
    );

    if (time != null && setDuration != null) {
      final duration = time.hour * 60 + time.minute;

      setDuration(duration);
    }
  }
}

class _WeekDaySelection extends StatelessWidget {
  const _WeekDaySelection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    return DropdownButtonFormField(
      decoration: const InputDecoration(labelText: 'Week day'),
      items: weekdays.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Row(
            children: [
              const Icon(Iconsax.calendar),
              const SizedBox(width: 16.0),
              Text(e),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value == null) return;
        onChanged(weekdays.indexOf(value), context.read());
      },
    );
  }

  void onChanged(int value, LessonCreateBloc bloc) {
    bloc.add(WeekdayChanged(weekday: value));
  }
}
