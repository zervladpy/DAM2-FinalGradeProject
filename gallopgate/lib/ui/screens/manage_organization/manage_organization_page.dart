
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/screens/manage_organization/bloc/organization_bloc.dart';
import 'package:gallopgate/ui/screens/manage_organization/widgets/organization_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/tiles/list_tile.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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
      body: BlocProvider(
        create: (_) => OrganizationBloc(
          organizationRepository: locator.get(),
          profileRepository: locator.get(),
        )..add(Fetch(organization.id!)),
        child: _Content(isAdmin: isAdmin),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
    required this.isAdmin,
  });

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizationBloc, OrganizationState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const CustomScrollView(
            slivers: [
              OrganizationSliverAppbar(organization: Organization.empty),
              SliverLinearLoading(),
            ],
          );
        }

        return CustomScrollView(
          slivers: [
            OrganizationSliverAppbar(organization: state.initial),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _Logo(organization: state.organization, isAdmin: isAdmin),
                    const SizedBox(height: 16.0),
                    _DescriptionField(isAdmin: isAdmin),
                    const SizedBox(height: 16.0),
                    if (isAdmin) const _UpdateButton(),
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

class _Logo extends StatelessWidget {
  const _Logo({
    super.key,
    required this.organization,
    required this.isAdmin,
  });

  final bool isAdmin;
  final Organization organization;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: isAdmin ? () {} : null,
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const Positioned(
              bottom: 5.0,
              right: 5.0,
              child: Icon(Iconsax.edit),
            )
          ],
        ),
        const SizedBox(width: 16.0),
        Expanded(child: _LessonTitle(isAdmin: isAdmin)),
      ],
    );
  }
}

class _Creator extends StatelessWidget {
  const _Creator({super.key});

  @override
  Widget build(BuildContext context) {
    return GListTile(
      item: ListTileItem(
          title: context.watch<OrganizationBloc>().state.creator.fullName,
          subtitle: 'Created at ${GDateUtils.formatDateToString(
            context.watch<OrganizationBloc>().state.organization.createdAt ??
                DateTime.now(),
          )}',
          leading: const Icon(Iconsax.user),
          navigate: () => context.push(
                '/managment/users/${context.watch<OrganizationBloc>().state.creator.id}',
              )),
    );
  }
}

class _LessonTitle extends StatelessWidget {
  const _LessonTitle({super.key, required this.isAdmin});

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizationBloc, OrganizationState>(
      buildWhen: (previous, current) =>
          previous.organization.name != current.organization.name,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.organization.name,
          enabled: isAdmin,
          onChanged: (name) =>
              context.read<OrganizationBloc>().add(NameChanged(name)),
          decoration: const InputDecoration(
            labelText: 'Name',
            prefixIcon: Icon(Iconsax.building),
          ),
        );
      },
    );
  }
}

class _DescriptionField extends StatelessWidget {
  const _DescriptionField({
    super.key,
    required this.isAdmin,
  });

  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizationBloc, OrganizationState>(
      buildWhen: (previous, current) =>
          previous.organization.description != current.organization.description,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.organization.description,
          enabled: isAdmin,
          maxLines: 5,
          maxLength: 250,
          buildCounter: (
            context, {
            required currentLength,
            required isFocused,
            maxLength,
          }) {
            return Text('$currentLength/$maxLength');
          },
          onChanged: (description) => context
              .read<OrganizationBloc>()
              .add(DescriptionChanged(description)),
          decoration: const InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(),
          ),
        );
      },
    );
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizationBloc, OrganizationState>(
      buildWhen: (previous, current) => previous.edited != current.edited,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.edited
              ? () => context.read<OrganizationBloc>().add(const Update())
              : null,
          child: const Text("Update"),
        );
      },
    );
  }
}
