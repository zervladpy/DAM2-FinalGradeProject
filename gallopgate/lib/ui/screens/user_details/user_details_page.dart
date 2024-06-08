import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/screens/user_details/bloc/user_bloc.dart';
import 'package:gallopgate/ui/screens/user_details/widgets/profile_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/containers/image_picker_container.dart';
import 'package:gallopgate/ui/widgets/inputs/selection.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({
    super.key,
    required this.id,
  });

  static page(String id) => MaterialPage(child: ProfileDetailsPage(id: id));

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => UserBloc(
          repository: locator.get(),
        )..add(Fetch(id: id)),
        child: const _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<MainBloc>();

    final organization = bloc.state.organization;
    final currentProfile = bloc.state.profile;

    final isAdmin = currentProfile.roles.any((role) => role.name == 'admin');

    return BlocConsumer<UserBloc, UserState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == Status.error) {
          GSnackbar.error(
            context: context,
            message: 'Failed to fetch profile details: ${state.error}',
          );
        }
      },
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return _LoadingState(organization: organization);
        }

        final canEdit = isAdmin || (state.profile.id == currentProfile.id);

        return CustomScrollView(
          slivers: [
            ProfileSliverAppbar(organization: organization),
            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ImagePickerContainer(onSelect: canEdit ? () {} : null),
                        const SizedBox(width: 16.0),
                        Expanded(child: _NameFiled(editable: canEdit)),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    _LastNameField(editable: canEdit),
                    const SizedBox(height: 16.0),
                    _BirthDateField(editable: canEdit),
                    const SizedBox(height: 16.0),
                    _RolesFieldSelection(editable: isAdmin),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState({super.key, required this.organization});

  final Organization organization;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ProfileSliverAppbar(organization: organization),
        const SliverLinearLoading(),
      ],
    );
  }
}

class _NameFiled extends StatelessWidget {
  const _NameFiled({
    super.key,
    this.editable = false,
  });

  final bool editable;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (prev, curr) =>
          prev.profile.firstName != curr.profile.firstName,
      builder: (context, state) {
        return TextFormField(
          enabled: editable,
          initialValue: state.profile.firstName,
          decoration: const InputDecoration(
            labelText: 'Name',
          ),
          onChanged: (value) => context
              .read<UserBloc>()
              .add(UserDetailFirstNameChangedEvent(value)),
        );
      },
    );
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField({
    super.key,
    this.editable = false,
  });

  final bool editable;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (prev, curr) => prev.profile.lastName != curr.profile.lastName,
      builder: (context, state) {
        return TextFormField(
          enabled: editable,
          initialValue: state.profile.lastName,
          decoration: const InputDecoration(
            labelText: 'Last Name',
          ),
          onChanged: (value) => context
              .read<UserBloc>()
              .add(UserDetailLastNameChangedEvent(value)),
        );
      },
    );
  }
}

/// TODO : Implement the following fields
class _BirthDateField extends StatelessWidget {
  const _BirthDateField({
    super.key,
    this.editable = false,
  });

  final bool editable;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 48.0,
      child: Placeholder(),
    );
  }
}

class _RolesFieldSelection extends StatelessWidget {
  const _RolesFieldSelection({
    super.key,
    this.editable = false,
  });

  final bool editable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Roles'),
        const SizedBox(height: 8.0),
        BlocBuilder<UserBloc, UserState>(
          buildWhen: (previous, current) =>
              previous.profile.roles != current.profile.roles,
          builder: (context, state) {
            return Selection(
              items: state.profile.roles.map((e) => e.name).toList(),
              selected: state.profile.roles.map((e) => e.name).toList(),
              onSelect: editable
                  ? (value) {
                      /// TODO : Handle role update
                    }
                  : null,
            );
          },
        )
      ],
    );
  }
}
