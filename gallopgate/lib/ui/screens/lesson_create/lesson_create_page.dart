import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/screens/lesson_create/widgets/lesson_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'bloc/lesson_create_bloc.dart';

class LessonCreatePage extends StatelessWidget {
  const LessonCreatePage({super.key});

  static get page => const MaterialPage(child: LessonCreatePage());

  @override
  Widget build(BuildContext context) {
    final organization = context.watch<MainBloc>().state.organization;

    return Scaffold(
      body: BlocProvider(
        create: (_) => LessonCreateBloc(organization.id, locator.get()),
        child: _LessonCreatePage(organization: organization),
      ),
    );
  }
}

class _LessonCreatePage extends StatelessWidget {
  const _LessonCreatePage({required this.organization});

  final Organization organization;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LessonCreateBloc, LessonCreateState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          GSnackbar.success(
            context: context,
            message: '${state.lesson.title} created successfully',
          );
          context.pop();
        } else if (state.status == Status.error) {
          GSnackbar.error(
            context: context,
            message: state.error ?? "An error occurred",
          );
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            LessonSliverAppbar(organization: organization),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverFillRemaining(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _TitleField(),
                    SizedBox(height: 16),
                    _DescriptionField(),
                    SizedBox(height: 16),
                    _SaveButton(),
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
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        bool isLoading = state.status == Status.loading;

        return ElevatedButton(
          onPressed: !isLoading
              ? () => context.read<LessonCreateBloc>().add(const LessonSubmit())
              : null,
          child: !isLoading
              ? const Text('Save')
              : const CircularProgressIndicator(),
        );
      },
    );
  }
}
