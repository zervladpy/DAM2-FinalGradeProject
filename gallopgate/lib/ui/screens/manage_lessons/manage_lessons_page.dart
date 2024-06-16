import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/manage_lessons/bloc/manage_lessons_bloc.dart';
import 'package:gallopgate/ui/screens/manage_lessons/widgets/manage_lessons.library.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:gallopgate/ui/widgets/tiles/list_tile.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ManageLessonsPage extends StatelessWidget {
  const ManageLessonsPage({super.key});

  static get page => const MaterialPage(child: ManageLessonsPage());

  @override
  Widget build(BuildContext context) {
    final organizationId = context.watch<MainBloc>().state.organization.id;

    return Scaffold(
      body: BlocProvider(
        create: (_) => ManageLessonsBloc(
          repository: locator.get(),
        )..add(Fetch(organizationId: organizationId!)),
        child: const _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    final organziation = context.watch<MainBloc>().state.organization;
    return BlocConsumer<ManageLessonsBloc, ManageLessonsState>(
      listener: (context, state) {
        if (state.status == Status.error) {
          GSnackbar.error(context: context, message: state.error!);
          context.pop();
        }
      },
      builder: (context, state) {
        if (state.status == Status.loading) {
          return CustomScrollView(
            slivers: [
              ManageLessonsSliverAppabar(organization: organziation),
              const SliverLinearLoading(),
            ],
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            context.read<ManageLessonsBloc>().add(
                  Fetch(organizationId: organziation.id!),
                );
          },
          child: CustomScrollView(
            slivers: [
              ManageLessonsSliverAppabar(organization: organziation),
              const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
              SliverList.builder(
                itemCount: state.lessons.length,
                itemBuilder: (context, index) {
                  final item = state.lessons[index];
                  return GListTile(
                    item: ListTileItem(
                      leading: const Icon(Iconsax.book),
                      title: item.title,
                      subtitle: item.categoryTitle,
                      navigate: () {
                        context.push("/managment/lessons/${item.id}");
                      },
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
