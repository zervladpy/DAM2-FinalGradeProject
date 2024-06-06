import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/ui/screens/manage_organization/widgets/organization_sliver_appbar.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';

class ManageOrganizationPage extends StatelessWidget {
  const ManageOrganizationPage({super.key});

  static get page => const MaterialPage(child: ManageOrganizationPage());

  @override
  Widget build(BuildContext context) {
    final MainBloc mainBloc = context.read<MainBloc>();

    final profile = mainBloc.state.profile;
    final organization = mainBloc.state.organization;

    final isAdmin = profile.roles.any((role) => role.name == 'admin');

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          OrganizationSliverAppbar(
            organization: organization,
            isAdmin: isAdmin,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverFillRemaining(child: Placeholder()),
        ],
      ),
    );
  }
}
