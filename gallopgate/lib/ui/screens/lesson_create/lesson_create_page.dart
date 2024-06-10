import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/ui/screens/lesson_create/controllers/bloc/lesson_create_bloc.dart';
import 'package:gallopgate/ui/screens/lesson_create/dialogs/instructor_dialog.dart';
import 'package:gallopgate/ui/screens/lesson_create/widgets/appbar/appbar.dart';
import 'package:gallopgate/ui/widgets/buttons/g_icon_button.dart';
import 'package:gallopgate/ui/widgets/inputs/counter_input.dart';
import 'package:gallopgate/ui/widgets/inputs/time_input_field.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:gallopgate/ui/widgets/tab_bar/tab_bar.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:iconsax/iconsax.dart';

class LessonCreatePage extends StatelessWidget {
  const LessonCreatePage({super.key});

  static get page => const MaterialPage(child: LessonCreatePage());

  @override
  Widget build(BuildContext context) {
    final organization = context.watch<MainBloc>().state.organization;

    assert(organization.id != null, 'no organization id provided');

    return Scaffold(
      body: BlocProvider(
        create: (_) => LessonCreateBloc(
          lessonRepository: locator.get(),
          lessonCategoryRepository: locator.get(),
          profileRepository: locator.get(),
          horseRepository: locator.get(),
          roleRepository: locator.get(),
        )..add(Fetch(organizationId: organization.id!)),
        child: CustomScrollView(
          slivers: [
            LessonCreateSliverAppbar(organization: organization),
            const _Content()
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonCreateBloc, LessonCreateState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == Status.error) {
          GSnackbar.error(context: context, message: state.error!);
        } else if (state.status == Status.success) {
          GSnackbar.success(context: context, message: 'Lesson created');
        }
      },
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const SliverLinearLoading();
        }

        return const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                _TitleField(),
                SizedBox(height: 16.0),
                _CategoryField(),
                SizedBox(height: 16.0),
                _Capacity(),
                SizedBox(height: 16.0),
                _WeekDayField(),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _StartAtField(),
                    SizedBox(width: 16.0),
                    _Duration(),
                  ],
                ),
                SizedBox(height: 16.0),
                _LessonMembers(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      buildWhen: (prev, curr) => prev.lesson.title != curr.lesson.title,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.lesson.title,
          onChanged: (value) =>
              context.read<LessonCreateBloc>().add(TitleChanged(title: value)),
          decoration: const InputDecoration(
            labelText: 'Title',
            hintText: 'Enter the lesson title',
          ),
        );
      },
    );
  }
}

class _CategoryField extends StatelessWidget {
  const _CategoryField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      builder: (context, state) {
        return DropdownButtonFormField(
          decoration: const InputDecoration(labelText: 'Category'),
          value: null,
          onChanged: (value) => context
              .read<LessonCreateBloc>()
              .add(CategoryChanged(category: value!)),
          items: state.categories
              .map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.title),
                  ))
              .toList(),
        );
      },
    );
  }
}

class _StartAtField extends StatelessWidget {
  const _StartAtField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Start At'),
        SizedBox(width: 16.0),
        TimeInputField(),
      ],
    );
  }
}

class _WeekDayField extends StatelessWidget {
  const _WeekDayField({super.key});

  @override
  Widget build(BuildContext context) {
    final weekdays = [
      'monday',
      'tuesday',
      'wednesday',
      'thursday',
      'friday',
      'saturday',
      'sunday',
    ];

    return BlocBuilder<LessonCreateBloc, LessonCreateState>(
      builder: (context, state) {
        return DropdownButtonFormField<String>(
          decoration: const InputDecoration(labelText: 'Weekday'),
          value: null,
          onChanged: (value) => context
              .read<LessonCreateBloc>()
              .add(WeekDayChanged(weekDay: weekdays.indexOf(value ?? ''))),
          items: weekdays
              .map((weekday) => DropdownMenuItem(
                    value: weekday,
                    child: Text(weekday),
                  ))
              .toList(),
        );
      },
    );
  }
}

class _Duration extends StatelessWidget {
  const _Duration({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Duration'),
        const SizedBox(width: 16.0),
        TimeInputField(
          time: DateTime(0, 0),
        )
      ],
    );
  }
}

class _Capacity extends StatelessWidget {
  const _Capacity({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Capacity'),
        CounterInputField(),
      ],
    );
  }
}

class _LessonMembers extends StatelessWidget {
  const _LessonMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const GTabBar(
            alignment: TabAlignment.fill,
            scrollable: false,
            tabs: ['Instructors', 'Riders'],
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.1,
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            child: const TabBarView(
              children: [_InstructorsPage(), _RidersPage()],
            ),
          ),
        ],
      ),
    );
  }
}

class _InstructorsPage extends StatelessWidget {
  const _InstructorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Total: 0'),
            const Spacer(),
            GIconButton.filled(
              icon: Iconsax.add,
              onPressed: () => _openModel(context),
            ),
          ],
        )
      ],
    );
  }

  Future<void> _openModel(BuildContext context) {
    final organization = context.read<MainBloc>().state.organization;
    final profiles = context.read<LessonCreateBloc>().state.profiles;
    final horses = context.read<LessonCreateBloc>().state.horses;

    return showAdaptiveDialog(
      context: context,
      useSafeArea: true,
      barrierColor: GColor.primaryLight.withOpacity(0.5),
      builder: (context) {
        return AddInstructorPage(
          title: organization.name,
          profiles: profiles,
          horses: horses,
        );
      },
    );
  }
}

class _RidersPage extends StatelessWidget {
  const _RidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Text('Total: 0'),
            const Spacer(),
            GIconButton.filled(
              icon: Iconsax.add,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
