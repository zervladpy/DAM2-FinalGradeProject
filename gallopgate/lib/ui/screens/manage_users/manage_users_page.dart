import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/screens/manage_users/bloc/profiles_bloc.dart';
import 'package:gallopgate/ui/screens/manage_users/widgets/users_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/buttons/g_icon_button.dart';
import 'package:gallopgate/ui/widgets/tiles/list_tile.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({super.key});

  static get page => const MaterialPage(child: ManageUsersPage());

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = context.read<MainBloc>();

    final profile = mainBloc.state.profile;
    final organization = mainBloc.state.organization;

    final isAdmin = profile.roles.any((role) => role.name == 'admin');

    return Scaffold(
      body: BlocProvider(
        create: (_) => ProfilesBloc(
          repository: locator.get(),
          id: organization.id,
        )..add(Fetch()),
        child: _ManageProfilesPage(
          organization: organization,
          isAdmin: isAdmin,
        ),
      ),
    );
  }
}

class _ManageProfilesPage extends StatelessWidget {
  const _ManageProfilesPage({
    super.key,
    required this.organization,
    required this.isAdmin,
  });

  final Organization organization;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilesBloc, ProfilesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            UsersSliverAppbar(organization: organization, isAdmin: isAdmin),
            if (state.status == Status.loading)
              const SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LinearProgressIndicator(),
                  ],
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
              separatorBuilder: (_, __) => const SizedBox(height: 5.0),
              itemBuilder: (_, index) {
                final profile = state.filtered[index];
                final item = ListTileItem(
                  title: profile.fullName,
                  subtitle: profile.email,
                  leading: const Icon(Iconsax.user),
                  navigate: () => context.push(
                    '/managment/users/${profile.id}',
                  ),
                );
                return GListTile(item: item);
              },
            )
          ],
        );
      },
    );
  }
}
