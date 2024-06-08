import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/horse_details/bloc/horse_bloc.dart';
import 'package:gallopgate/ui/screens/horse_details/widgets/horse_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/containers/image_picker_container.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class HorseDetailsPage extends StatelessWidget {
  const HorseDetailsPage({super.key, required this.id});

  final String id;

  static page(String id) => MaterialPage(child: HorseDetailsPage(id: id));

  @override
  Widget build(BuildContext context) {
    final organizationId = context.read<MainBloc>().state.organization.id;

    return Scaffold(
      body: BlocProvider(
        create: (_) => HorseBloc(
          horseRepository: locator.get(),
          profileRepository: locator.get(),
        )..add(Fetch(
            id: id,
            organizationId: organizationId,
          )),
        child: const _HorseDetailsPage(),
      ),
    );
  }
}

class _HorseDetailsPage extends StatelessWidget {
  const _HorseDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();

    final organization = bloc.state.organization;
    final profile = bloc.state.profile;

    final isAdmin = profile.roles.any((role) => role.name == 'admin');

    return BlocConsumer<HorseBloc, HorseState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == Status.error) {
          GSnackbar.error(
            context: context,
            message: 'Error : ${state.error ?? 'Unexpected error'}',
          );
        }

        if (state.status == Status.success) {
          GSnackbar.success(
            context: context,
            message: 'Horse ${state.horse.alias} updated successfully',
          );

          context.pop();
        }
      },
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return CustomScrollView(
            slivers: [
              HorseSliverAppbar(organization: organization),
              const SliverLinearLoading()
            ],
          );
        }

        return CustomScrollView(
          slivers: [
            HorseSliverAppbar(organization: organization),
            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverList.list(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ImagePickerContainer(onSelect: isAdmin ? () {} : null),
                      const SizedBox(width: 16.0),
                      Expanded(child: _AliasField(editable: isAdmin)),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  _NameField(editable: isAdmin),
                  const SizedBox(height: 16.0),
                  const _OwnerField(),
                  const SizedBox(height: 16.0),
                  if (isAdmin) const _UpdateButton(),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class _AliasField extends StatelessWidget {
  const _AliasField({
    super.key,
    this.editable = false,
  });

  final bool editable;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorseBloc, HorseState>(
      buildWhen: (prev, curr) => prev.horse.alias != curr.horse.alias,
      builder: (context, state) {
        return TextFormField(
          enabled: editable,
          initialValue: state.horse.alias,
          onChanged: (alias) {
            context.read<HorseBloc>().add(AliasChanged(alias: alias));
          },
          decoration: const InputDecoration(
            labelText: 'Alias',
          ),
        );
      },
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    super.key,
    this.editable = false,
  });

  final bool editable;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorseBloc, HorseState>(
      buildWhen: (prev, curr) => prev.horse.fullName != curr.horse.fullName,
      builder: (context, state) {
        return TextFormField(
          enabled: editable,
          initialValue: state.horse.fullName,
          onChanged: (name) {
            context.read<HorseBloc>().add(NameChanged(name: name));
          },
          decoration: const InputDecoration(
            labelText: 'Name',
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
    return BlocBuilder<HorseBloc, HorseState>(
      buildWhen: (prev, curr) => prev.edited != curr.edited,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.edited
              ? () => context.read<HorseBloc>().add(const Update())
              : null,
          child: const Text('Update'),
        );
      },
    );
  }
}

class _OwnerField extends StatelessWidget {
  const _OwnerField({super.key});

  @override
  Widget build(BuildContext context) {
    final organization = context.read<MainBloc>().state.organization;

    return BlocBuilder<HorseBloc, HorseState>(
      builder: (context, state) {
        return DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: 'Owner',
          ),
          value: state.horse.ownerId,
          items: state.profiles
              .map((profile) => DropdownMenuItem(
                    value: profile.id,
                    child: Row(children: [
                      const Icon(Iconsax.user),
                      const SizedBox(width: 8.0),
                      Text(profile.fullName),
                    ]),
                  ))
              .toList()
            ..add(
              DropdownMenuItem(
                value: null,
                child: Row(children: [
                  const Icon(Iconsax.building),
                  const SizedBox(width: 8.0),
                  Text(organization.name),
                ]),
              ),
            ),
          onChanged: (ownerId) {
            context.read<HorseBloc>().add(OwnerChanged(ownerId: ownerId));
          },
        );
      },
    );
  }
}
