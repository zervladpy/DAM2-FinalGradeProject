import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/ui/screens/user_create/bloc/create_user_bloc.dart';
import 'package:gallopgate/ui/screens/user_create/widgets/user_creat_sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/inputs/selection.dart';
import 'package:gallopgate/ui/widgets/loading/sliver_linear_loading.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class UserCreatePage extends StatelessWidget {
  const UserCreatePage({super.key});

  static get page => const MaterialPage(child: UserCreatePage());

  @override
  Widget build(BuildContext context) {
    final organizationId = context.read<MainBloc>().state.organization.id;

    return Scaffold(
      body: BlocProvider(
        create: (_) => CreateUserBloc(
          organizationId: organizationId!,
          profileRepository: locator.get(),
          roleRepository: locator.get(),
        )..add(CreateUserInitialize()),
        child: const _UserCreatePage(),
      ),
    );
  }
}

class _UserCreatePage extends StatelessWidget {
  const _UserCreatePage();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserBloc, CreateUserState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == Status.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: context.colorScheme.error,
              content: Text(
                'Error: ${state.error}',
                style: TextStyle(color: context.colorScheme.onError),
              ),
            ),
          );
        } else if (state.status == Status.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('User created successfully'),
            ),
          );
          context.pop();
        }
      },
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const CustomScrollView(
            slivers: [
              UserCreatSliverAppbar(),
              SliverLinearLoading(),
            ],
          );
        }

        return CustomScrollView(
          slivers: [
            const UserCreatSliverAppbar(),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList.list(
                children: const [
                  _NameField(),
                  SizedBox(height: 16.0),
                  _LastNameField(),
                  SizedBox(height: 16.0),
                  _EmailField(),
                  SizedBox(height: 16.0),
                  _RoleSelection(),
                  SizedBox(height: 16.0),
                  _SubmittButton(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    final errorText = context.watch<CreateUserBloc>().state.firstNameError;

    return BlocBuilder<CreateUserBloc, CreateUserState>(
      buildWhen: (prev, curr) => prev.firstNameError != curr.firstNameError,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.firstNameError,
          onChanged: (value) => context.read<CreateUserBloc>().add(
                CreateUserFirstNameChanged(value),
              ),
          decoration: InputDecoration(
            labelText: 'Fist Name',
            errorText: errorText,
            prefixIcon: const Icon(Iconsax.user),
          ),
        );
      },
    );
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField();

  @override
  Widget build(BuildContext context) {
    final errorText = context.watch<CreateUserBloc>().state.lastNameError;

    return BlocBuilder<CreateUserBloc, CreateUserState>(
      buildWhen: (prev, curr) => prev.lastNameError != curr.lastNameError,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.lastName,
          onChanged: (value) => context.read<CreateUserBloc>().add(
                CreateUserLastNameChanged(value),
              ),
          decoration: InputDecoration(
            labelText: 'Last Name',
            errorText: errorText,
            prefixIcon: const Icon(Iconsax.user),
          ),
        );
      },
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    final errorText = context.watch<CreateUserBloc>().state.emailError;

    return BlocBuilder<CreateUserBloc, CreateUserState>(
      buildWhen: (prev, curr) => prev.emailError != curr.emailError,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email,
          onChanged: (value) => context.read<CreateUserBloc>().add(
                CreateUserEmailChanged(value),
              ),
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: errorText,
            prefixIcon: const Icon(Iconsax.sms),
          ),
        );
      },
    );
  }
}

class _RoleSelection extends StatelessWidget {
  const _RoleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserBloc, CreateUserState>(
      buildWhen: (prev, curr) => prev.selectedRoles != curr.selectedRoles,
      builder: (context, state) {
        if (state.roles.isEmpty) {
          return const SizedBox();
        }

        return Selection(
          selected: state.selectedRoles.map((e) => e.name).toList(),
          onSelect: (value) {
            final role = state.roles.firstWhere((e) => e.name == value);
            context.read<CreateUserBloc>().add(CreateUserRoleChanged(role));
          },
          items: state.roles.map((e) => e.name).toList(),
        );
      },
    );
  }
}

class _SubmittButton extends StatelessWidget {
  const _SubmittButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserBloc, CreateUserState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status == Status.loading
              ? null
              : () => context.read<CreateUserBloc>().add(CreateUserSubmitted()),
          child: const Text('Submit'),
        );
      },
    );
  }
}
