import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/screens/manage_lessons_category/bloc/manage_lesson_category_bloc.dart';
import 'package:gallopgate/ui/screens/manage_lessons_category/widgets/lessons_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/buttons/g_icon_button.dart';
import 'package:gallopgate/ui/widgets/tiles/list_tile.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ManageLessonCategoryPage extends StatelessWidget {
  const ManageLessonCategoryPage({super.key});

  static get page => const MaterialPage(child: ManageLessonCategoryPage());

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = context.read<MainBloc>();

    final profile = mainBloc.state.profile;
    final organization = mainBloc.state.organization;

    final isAdmin = profile.roles.any((role) => role.name == 'admin');

    return Scaffold(
      body: BlocProvider(
        create: (_) => ManageLessonCategoryBloc(
          repository: locator.get(),
          id: organization.id!,
        )..add(Fetch()),
        child: _Content(
          organization: organization,
          isAdmin: isAdmin,
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
    required this.organization,
    required this.isAdmin,
  });

  final Organization organization;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageLessonCategoryBloc, ManageLessonCategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<ManageLessonCategoryBloc>().add(Fetch());
          },
          child: CustomScrollView(
            slivers: [
              LessonsSliverAppbar(organization: organization, isAdmin: isAdmin),
              if (state.status == Status.loading)
                const SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [LinearProgressIndicator()],
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Filter',
                          prefixIcon: Icon(Iconsax.search_normal_1),
                        ),
                      )),
                      const SizedBox(width: 5),
                      const GIconButton.filled(icon: Iconsax.filter),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverList.separated(
                itemCount: state.filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 5),
                itemBuilder: (_, index) {
                  final lesson = state.filtered[index];
                  final item = ListTileItem(
                    title: lesson.title,
                    subtitle: lesson.description,
                    navigate: () => context.push(
                      '/managment/lesson-categories/${lesson.id}',
                    ),
                    leading: const Icon(Iconsax.book),
                  );

                  return GListTile(item: item);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
