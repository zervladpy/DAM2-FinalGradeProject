import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/ui/screens/main_manage/widgets/manage_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/tiles/list_tile.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class MainManagePage extends StatelessWidget {
  const MainManagePage({super.key});

  static const page = MaterialPage(child: MainManagePage());

  @override
  Widget build(BuildContext context) {
    final organization = context.watch<MainBloc>().state.organization;

    final List<ListTileItem> items = [
      ListTileItem(
        title: 'Organization',
        subtitle: 'Manage your organization details',
        leading: const Icon(Iconsax.building),
        navigate: () => context.push('/managment/organization'),
      ),
      ListTileItem(
        title: 'Lesssons',
        subtitle: 'Manage your lessons',
        leading: const Icon(Iconsax.book),
        navigate: () => context.push('/managment/lessons'),
      ),
      ListTileItem(
        title: 'Users',
        subtitle: 'Manage your users',
        leading: const Icon(Iconsax.user),
        navigate: () => context.push('/managment/users'),
      ),
      ListTileItem(
        title: 'Horses',
        subtitle: 'Manage your horses',
        leading: const Icon(Iconsax.language_circle),
        navigate: () => context.push('/managment/horses'),
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ManageSliverAppbar(organization: organization),
          const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
          SliverList.separated(
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 5.0),
            itemBuilder: (_, index) => GListTile(item: items[index]),
          ),
        ],
      ),
    );
  }
}
