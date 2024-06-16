import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/common/utils/role_utils.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/router/router.library.dart';
import 'package:gallopgate/ui/screens/lesson_category/controllers/details/lesson_category_bloc.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/buttons/g_icon_button.dart';
import 'package:gallopgate/ui/widgets/inputs/multiline_input_field.dart';
import 'package:gallopgate/ui/widgets/inputs/text_field/text_form_filed.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:iconsax/iconsax.dart';

class LessonCategoryDetailsPage extends StatelessWidget {
  const LessonCategoryDetailsPage({
    super.key,
    required this.id,
  });

  final String id;

  static page(String id) {
    return MaterialPage(child: LessonCategoryDetailsPage(id: id));
  }

  @override
  Widget build(BuildContext context) {
    final event = Initialize(id: id);

    return Scaffold(
      body: BlocProvider(
        create: (_) => LessonCategoryBloc(
          repository: locator.get(),
        )..add(event),
        child: const _Contnet(),
      ),
    );
  }
}

class _Contnet extends StatelessWidget {
  const _Contnet({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MainBloc>();
    final profile = bloc.state.profile;
    final organization = bloc.state.organization;

    final isAdmin = GRolesUtils.isAdmin(profile.roles);

    return BlocConsumer<LessonCategoryBloc, LessonCategoryState>(
      listenWhen: _listen,
      listener: _listener,
      buildWhen: _listen,
      builder: (contex, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context
                .read<LessonCategoryBloc>()
                .add(Initialize(id: state.category.id));
          },
          child: CustomScrollView(
            slivers: [
              GSliverAppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GAppbarTitle('Lesson Category'),
                    GAppbarSubtitle(organization.name),
                  ],
                ),
                actions: [
                  _DeleteButton(isAdmin: isAdmin),
                ],
              ),
              if (state.status == Status.loading) const SliverLinearLoading(),
              if (state.status != Status.loading)
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _TitleField(
                          enabled: isAdmin && state.status != Status.loading,
                        ),
                        const SizedBox(height: 16.0),
                        _DescriptionField(
                          enabled: isAdmin && state.status != Status.loading,
                        ),
                        const SizedBox(height: 16.0),
                        _UpdateButton(
                          enabled: isAdmin && state.status != Status.loading,
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }

  bool _listen(LessonCategoryState prev, LessonCategoryState curr) {
    return prev.status != curr.status;
  }

  void _listener(BuildContext context, LessonCategoryState state) {
    if (state.status == Status.error) {}
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField({
    super.key,
    this.enabled = false,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCategoryBloc, LessonCategoryState>(
      buildWhen: _listen,
      builder: (context, state) {
        return GTextFormField(
          initialValue: state.category.title,
          prefixIcon: Iconsax.text_block,
          enabled: enabled,
          label: 'Name',
          onChanged: (value) => _onChanged(value, context.read()),
        );
      },
    );
  }

  bool _listen(LessonCategoryState previous, LessonCategoryState current) {
    return previous.category.title != current.category.title;
  }

  void _onChanged(String value, LessonCategoryBloc bloc) {
    bloc.add(TitleChanged(title: value));
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField({
    super.key,
    this.enabled = false,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCategoryBloc, LessonCategoryState>(
      buildWhen: _listen,
      builder: (context, state) {
        return MultilineInputField(
          initialValue: state.category.description,
          enabled: enabled,
          label: 'Description',
          onChanged: (value) => _onChanged(value, context.read()),
        );
      },
    );
  }

  bool _listen(LessonCategoryState previous, LessonCategoryState current) {
    return previous.category.description != current.category.description;
  }

  void _onChanged(String value, LessonCategoryBloc bloc) {
    bloc.add(DescriptionChanged(description: value));
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton({
    super.key,
    this.enabled = false,
  });

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCategoryBloc, LessonCategoryState>(
      buildWhen: _listen,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: enabled ? () => _onPressed(context.read()) : null,
          child: const Text('Update'),
        );
      },
    );
  }

  bool _listen(LessonCategoryState previous, LessonCategoryState current) {
    return previous.category != current.category;
  }

  void _onPressed(LessonCategoryBloc bloc) {
    bloc.add(const Submit());
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton({
    super.key,
    this.isAdmin = false,
  });

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    if (!isAdmin) {
      return const SizedBox();
    }

    return GIconButton(
      icon: Iconsax.trash,
      onPressed: () {
        _onPressed(context.read());
        context.pop();
      },
    );
  }

  void _onPressed(LessonCategoryBloc bloc) {
    bloc.add(const Delete());
  }
}
