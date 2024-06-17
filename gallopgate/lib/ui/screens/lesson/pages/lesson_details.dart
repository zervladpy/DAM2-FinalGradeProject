import 'package:flutter/material.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/common/utils/role_utils.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/ui/router/router.library.dart';
import 'package:gallopgate/ui/screens/lesson/controllers/lesson/lesson_bloc.dart';
import 'package:gallopgate/ui/screens/lesson/widgets/appbars/lesson_details_appbar.dart';
import 'package:gallopgate/ui/screens/lesson/widgets/grids/member_grid.dart';
import 'package:gallopgate/ui/screens/org_create/library.dart';
import 'package:gallopgate/ui/widgets/inputs/text_field/text_form_filed.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:gallopgate/ui/widgets/tiles/list_tile.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:iconsax/iconsax.dart';

class LessonDetailsPage extends StatelessWidget {
  const LessonDetailsPage({super.key, required this.id});

  static page(String id) => MaterialPage(child: LessonDetailsPage(id: id));

  final String id;

  @override
  Widget build(BuildContext context) {
    final organizationId = context.watch<MainBloc>().state.organization.id!;

    return Scaffold(
      body: BlocProvider(
        create: (_) => LessonBloc(
          lessonRepository: locator.get(),
          lessonCategoryRepository: locator.get(),
          profileRepository: locator.get(),
          horseRepository: locator.get(),
          lessonMembersRepository: locator.get(),
        )..add(Fetch(id, organizationId)),
        child: const _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MainBloc>();
    final organization = bloc.state.organization;
    final profile = bloc.state.profile;

    final bool isAdmin = GRolesUtils.isAdmin(profile.roles);

    return BlocConsumer<LessonBloc, LessonState>(
      listenWhen: _listenWhen,
      listener: _listener,
      buildWhen: _listenWhen,
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<LessonBloc>().add(
                  Fetch(state.lesson.id, organization.id!),
                );
          },
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  LessonDetailsSliverAppbar(
                    organization: organization,
                    isAdmin: isAdmin,
                  ),
                  if (state.status == Status.loading)
                    const SliverLinearLoading(),
                  if (state.status != Status.loading)
                    SliverPadding(
                      padding: const EdgeInsets.all(16.0),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          children: [
                            _TitleField(isAdmin: isAdmin),
                            const SizedBox(height: 16.0),
                            _InstructorField(isAdmin: isAdmin),
                            const SizedBox(height: 16.0),
                            _StartAtField(isAdmin: isAdmin),
                            const SizedBox(height: 16.0),
                            _DurationField(isAdmin: isAdmin),
                            const SizedBox(height: 16.0),
                            _WeekDayField(isAdmin: isAdmin),
                            const SizedBox(height: 16.0),
                            const _MembersGrid(),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                left: 16.0,
                child: _UpdateButton(isAdmin: isAdmin),
              ),
            ],
          ),
        );
      },
    );
  }

  bool _listenWhen(LessonState prev, LessonState curr) {
    if (prev.status != curr.status) return true;
    return false;
  }

  Future<void> _listener(
    BuildContext context,
    LessonState state,
  ) async {
    if (state.status == Status.error) {
      GSnackbar.error(
        context: context,
        message: state.error,
      );
    }

    if (state.status == Status.success) {
      GSnackbar.success(
        context: context,
        message: 'Action successful on ${state.lesson.id}',
      );
    }
  }
}

class _MembersGrid extends StatelessWidget {
  const _MembersGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      buildWhen: _listenWhen,
      builder: (context, state) {
        return MemberGrid(
          members: state.lesson.lessonMembers,
        );
      },
    );
  }

  bool _listenWhen(
    LessonState previous,
    LessonState current,
  ) {
    if (previous.lesson.lessonMembers != current.lesson.lessonMembers) {
      return true;
    }
    return false;
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField({
    super.key,
    this.isAdmin = false,
  });

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      buildWhen: _listenWhen,
      builder: (context, state) {
        return GTextFormField(
          label: 'Title',
          enabled: isAdmin,
          prefixIcon: Iconsax.text_block,
          initialValue: state.lesson.title,
          onChanged: (value) => _onChanged(context.read(), value),
          validator: _validator,
        );
      },
    );
  }

  bool _listenWhen(LessonState prev, LessonState curr) {
    if (prev.lesson.title != curr.lesson.title) return true;
    return false;
  }

  String? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'required';
    }
    return null;
  }

  void _onChanged(LessonBloc bloc, String? value) {
    if (value == null) return;
    bloc.add(TitleChanged(value));
  }
}

class _InstructorField extends StatelessWidget {
  const _InstructorField({
    super.key,
    this.isAdmin = false,
  });

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        final initalValue = state.instructors.where((i) {
          return i.id == state.lesson.instructor.id;
        }).toList();

        return DropdownButtonFormField<Profile>(
          value: initalValue.isNotEmpty ? initalValue.first : null,
          decoration: const InputDecoration(
            labelText: 'Instructor',
          ),
          items: state.instructors.map((i) {
            return DropdownMenuItem(
              value: i,
              child: Row(
                children: [
                  const Icon(Iconsax.user),
                  const SizedBox(width: 8.0),
                  Text('${i.firstName} ${i.lastName}'),
                ],
              ),
            );
          }).toList(),
          onChanged:
              isAdmin ? (value) => _onChanged(context.read(), value) : null,
        );
      },
    );
  }

  void _onChanged(
    LessonBloc bloc,
    Profile? value,
  ) {
    if (value == null) return;
    bloc.add(InstructorChanged(value));
  }
}

class _StartAtField extends StatelessWidget {
  const _StartAtField({
    super.key,
    this.isAdmin = false,
  });

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      buildWhen: _listenWhen,
      builder: (context, state) {
        return GListTile(
          contentPadding: const EdgeInsets.only(left: 8.0),
          item: ListTileItem(
            leading: const Icon(Iconsax.clock),
            title: 'Start At',
            navigate: isAdmin
                ? () => _openTimePickerDialog(
                      context,
                      state.lesson.startAt ?? DateTime.now(),
                    )
                : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  state.lesson.startAt != null
                      ? GDateUtils.formatTimeToString(
                          state.lesson.startAt!,
                        )
                      : 'Select',
                  style: context.textTheme.bodyLarge,
                ),
                const SizedBox(width: 8.0),
                const Icon(Iconsax.arrow_right_3),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _listenWhen(LessonState prev, LessonState curr) {
    if (prev.lesson.startAt != curr.lesson.startAt) return true;
    return false;
  }

  void _openTimePickerDialog(
    BuildContext context,
    DateTime value,
  ) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(value),
    ).then((time) {
      if (time == null) return;
      final newTime = DateTime(
        value.year,
        value.month,
        value.day,
        time.hour,
        time.minute,
      );
      _onChanged(context.read(), newTime);
    });
  }

  void _onChanged(
    LessonBloc bloc,
    DateTime value,
  ) {
    bloc.add(StartAtChanged(value));
  }
}

class _DurationField extends StatelessWidget {
  const _DurationField({
    super.key,
    this.isAdmin = false,
  });

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        final time = DateTime(
          0,
          0,
          0,
          state.lesson.duration ~/ 60,
          state.lesson.duration % 60,
        );

        return GListTile(
          contentPadding: const EdgeInsets.only(left: 8.0),
          item: ListTileItem(
            leading: const Icon(Iconsax.clock),
            title: 'Duration',
            navigate:
                isAdmin ? () => _openTimePickerDialog(context, time) : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  state.lesson.startAt != null
                      ? GDateUtils.formatTimeToString(time)
                      : 'Select',
                  style: context.textTheme.bodyLarge,
                ),
                const SizedBox(width: 8.0),
                const Icon(Iconsax.arrow_right_3),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onChanged(
    LessonBloc bloc,
    DateTime? value,
  ) {
    if (value == null) return;
    bloc.add(DurationChanged(value));
  }

  bool _listenWhen(LessonState prev, LessonState curr) {
    if (prev.lesson.duration != curr.lesson.duration) return true;
    return false;
  }

  String? _validator(DateTime? value) {
    if (value == null) {
      return 'required';
    }
    return null;
  }

  void _openTimePickerDialog(
    BuildContext context,
    DateTime value,
  ) {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(value),
    ).then((time) {
      if (time == null) return;
      final newTime = DateTime(
        value.year,
        value.month,
        value.day,
        time.hour,
        time.minute,
      );
      _onChanged(context.read(), newTime);
    });
  }
}

class _WeekDayField extends StatelessWidget {
  const _WeekDayField({
    super.key,
    this.isAdmin = false,
  });

  final bool isAdmin;

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

    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        return DropdownButtonFormField(
          value: weekdays[state.lesson.weekday],
          items: weekdays.map((day) {
            return DropdownMenuItem(
              value: day,
              child: Row(
                children: [
                  const Icon(Iconsax.calendar_1),
                  const SizedBox(width: 8.0),
                  Text(day),
                ],
              ),
            );
          }).toList(),
          onChanged: isAdmin
              ? (String? value) => _onChanged(
                    context.read(),
                    weekdays.indexOf(value ?? ''),
                  )
              : null,
        );
      },
    );
  }

  void _onChanged(LessonBloc bloc, int? value) {
    if (value == null) return;
    bloc.add(WeekdayChanged(value));
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton({
    super.key,
    this.isAdmin = false,
  });

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    if (!isAdmin) return const SizedBox();
    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () => _onPressed(context.read()),
          child: const Text('Update'),
        );
      },
    );
  }

  void _onPressed(LessonBloc bloc) {
    bloc.add(const Update());
  }
}
