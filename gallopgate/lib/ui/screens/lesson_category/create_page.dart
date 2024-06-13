import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/common/utils/role_utils.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/screens/lesson_category/controllers/create/create_lesson_category_bloc.dart';
import 'package:gallopgate/ui/screens/lesson_category/widgets/lesson_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/inputs/multiline_input_field.dart';
import 'package:gallopgate/ui/widgets/inputs/text_field/text_form_filed.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LessonCategoryCreatePage extends StatelessWidget {
  const LessonCategoryCreatePage({super.key});

  static get page => const MaterialPage(child: LessonCategoryCreatePage());

  @override
  Widget build(BuildContext context) {
    final organization = context.watch<MainBloc>().state.organization;
    final creator = context.watch<MainBloc>().state.profile;
    final isAdmin = GRolesUtils.isAdmin(creator.roles);

    final event = Initialize(creator: creator, organization: organization);

    log(isAdmin.toString());

    return Scaffold(
      body: BlocProvider(
        create: (_) => CreateLessonCategoryBloc(
          repository: locator.get(),
        )..add(event),
        child: _LessonCreatePage(
          organization: organization,
          isAdmin: isAdmin,
        ),
      ),
    );
  }
}

class _LessonCreatePage extends StatelessWidget {
  const _LessonCreatePage({
    required this.organization,
    required this.isAdmin,
  });

  final Organization organization;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateLessonCategoryBloc, CreateLessonCategoryState>(
      listener: (context, state) {
        log(state.status.toString());
        if (state.status == Status.success) {
          GSnackbar.success(
            context: context,
            message: '${state.category.title} created successfully',
          );
          context.pop();
        } else if (state.status == Status.error) {
          log(state.error.toString());
          GSnackbar.error(
            context: context,
            message: state.error,
          );
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            LessonSliverAppbar(organization: organization),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _TitleField(enabled: isAdmin),
                    const SizedBox(height: 16),
                    _DescriptionField(enabled: isAdmin),
                    const SizedBox(height: 16),
                    _SaveButton(enabled: isAdmin),
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

class _TitleField extends StatelessWidget {
  const _TitleField({
    this.enabled = false,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateLessonCategoryBloc, CreateLessonCategoryState>(
      buildWhen: (prev, curr) => prev.category.title != curr.category.title,
      builder: (context, state) {
        return GTextFormField(
          onChanged: (value) => _onChange(value, context.read()),
          label: "Name",
          enabled: enabled,
          initialValue: state.category.title,
          prefixIcon: Iconsax.text_block,
        );
      },
    );
  }

  void _onChange(String value, CreateLessonCategoryBloc bloc) {
    bloc.add(TitleChaged(title: value));
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField({
    this.enabled = false,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return MultilineInputField(
      label: "Description",
      enabled: enabled,
      onChanged: (value) => _onChange(value, context.read()),
    );
  }

  void _onChange(String value, CreateLessonCategoryBloc bloc) {
    bloc.add(DescriptionChanged(description: value));
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    this.enabled = false,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateLessonCategoryBloc, CreateLessonCategoryState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        bool isEnabled = state.status != Status.loading && enabled;

        return ElevatedButton(
          onPressed: isEnabled ? () => _onSave(context.read()) : null,
          child: const Text('Create'),
        );
      },
    );
  }

  void _onSave(CreateLessonCategoryBloc bloc) {
    bloc.add(const Submit());
  }
}
