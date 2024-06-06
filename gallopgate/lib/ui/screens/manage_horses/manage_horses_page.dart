import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/screens/manage_horses/bloc/horses_bloc.dart';
import 'package:gallopgate/ui/screens/manage_horses/widgets/horses_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/buttons/g_icon_button.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/tiles/list_tile.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ManageHorsesPage extends StatelessWidget {
  const ManageHorsesPage({super.key});

  static get page => const MaterialPage(child: ManageHorsesPage());

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = context.read<MainBloc>();

    final organization = mainBloc.state.organization;
    final profile = mainBloc.state.profile;
    final isAdmin = profile.roles.any((role) => role.name == 'admin');

    return Scaffold(
      body: BlocProvider(
        create: (context) => HorsesBloc(
          horseRepository: locator.get(),
          id: organization.id,
        )..add(Fetch()),
        child: _ManageHorsesPage(organization: organization, isAdmin: isAdmin),
      ),
    );
  }
}

class _ManageHorsesPage extends StatelessWidget {
  const _ManageHorsesPage({
    super.key,
    required this.organization,
    required this.isAdmin,
  });

  final Organization organization;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HorsesBloc, HorsesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            HorsesSliverAppbar(organization: organization, isAdmin: isAdmin),
            if (state.status == Status.loading) const SliverLinearLoading(),
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
              separatorBuilder: (_, __) => const SizedBox(height: 5.0),
              itemBuilder: (_, index) {
                final Horse horse = state.filtered[index];
                final item = ListTileItem(
                  leading: const Icon(Iconsax.activity),
                  title: horse.fullName,
                  subtitle: horse.alias,
                  navigate: () => context.push('/managment/horses/${horse.id}'),
                );
                return GListTile(item: item);
              },
            ),
          ],
        );
      },
    );
  }
}
