import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/horse_create/bloc/horse_create_bloc.dart';
import 'package:gallopgate/ui/screens/horse_create/widgets/horse_create_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';

class HorseCreatePage extends StatelessWidget {
  const HorseCreatePage({
    super.key,
  });

  static get page => const MaterialPage(child: HorseCreatePage());

  @override
  Widget build(BuildContext context) {
    final organizaitonId = context.read<MainBloc>().state.organization.id;

    return BlocProvider(
      create: (context) => HorseCreateBloc(
        horseRepository: locator.get(),
        profileRepository: locator.get(),
        organizationId: organizaitonId,
      )..add(const HorseCreateInitialize()),
      child: const Scaffold(body: _HorseCreatePage()),
    );
  }
}

class _HorseCreatePage extends StatelessWidget {
  const _HorseCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HorseCreateBloc, HorseCreateState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == Status.success) {
          GSnackbar.success(
            context: context,
            message: '${state.horse.alias} was created.',
          );
          context.pop();
        } else if (state.status == Status.error) {
          GSnackbar.error(context: context, message: state.error!);
        }
      },
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const CustomScrollView(
            slivers: [
              HorseCreateSliverAppbar(),
              SliverLinearLoading(),
            ],
          );
        }
        return const CustomScrollView(
          slivers: [
            HorseCreateSliverAppbar(),
            SliverToBoxAdapter(
              child: _HorseCreateForm(),
            ),
          ],
        );
      },
    );
  }
}

class _HorseCreateForm extends StatelessWidget {
  const _HorseCreateForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _HorseNameField(),
            SizedBox(height: 16.0),
            _HorseAliasField(),
            SizedBox(height: 16.0),
            _HorseOwnerField(),
            SizedBox(height: 16.0),
            _HorseSubmitButton(),
          ],
        ),
      ),
    );
  }
}

class _HorseNameField extends StatelessWidget {
  const _HorseNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HorseCreateBloc>();

    return TextFormField(
      initialValue: context.watch<HorseCreateBloc>().state.horse.fullName,
      onChanged: (value) => bloc.add(HorseCreateNameChanged(value)),
      decoration: const InputDecoration(
        labelText: 'Name',
      ),
    );
  }
}

class _HorseAliasField extends StatelessWidget {
  const _HorseAliasField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HorseCreateBloc>();

    return TextFormField(
      initialValue: context.watch<HorseCreateBloc>().state.horse.alias,
      onChanged: (value) => bloc.add(HorseCreateAliasChanged(value)),
      decoration: const InputDecoration(
        labelText: 'Alias',
      ),
    );
  }
}

class _HorseOwnerField extends StatelessWidget {
  const _HorseOwnerField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HorseCreateBloc>();
    final profiles = context.watch<HorseCreateBloc>().state.profiles;

    return DropdownMenu<String?>(
      label: const Text('Owner'),
      width: 700,
      expandedInsets: EdgeInsets.zero,
      errorText: context.watch<HorseCreateBloc>().state.error,
      initialSelection: context.watch<HorseCreateBloc>().state.horse.ownerId,
      onSelected: (value) => bloc.add(HorseCreateOwnerIdChanged(value ?? '')),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        contentPadding: EdgeInsets.all(8.0),
        constraints: BoxConstraints(
          minHeight: 48.0,
          maxHeight: 48.0,
        ),
      ),
      dropdownMenuEntries: profiles.map(
        (profile) {
          return DropdownMenuEntry(
            label: profile.fullName,
            value: profile.id,
          );
        },
      ).toList(),
    );
  }
}

class _HorseSubmitButton extends StatelessWidget {
  const _HorseSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HorseCreateBloc>();

    return ElevatedButton(
      onPressed: () => bloc.add(const HorseCreateSubmitt()),
      child: const Text('Save'),
    );
  }
}
