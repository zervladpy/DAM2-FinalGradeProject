import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/models/role/role.dart';
import 'package:gallopgate/ui/screens/user_create/bloc/create_user_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class UserCreatePage extends StatelessWidget {
  const UserCreatePage({super.key, required this.organizationId});

  static page(String organizaitonId) => MaterialPage(
          child: UserCreatePage(
        organizationId: organizaitonId,
      ));

  final String organizationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateUserBloc(
        organizationId: organizationId,
        profileRepository: locator.get(),
        roleRepository: locator.get(),
      )..add(CreateUserInitialize()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create User'),
        ),
        body: const _UserCreatePage(),
      ),
    );
  }
}

class _UserCreatePage extends StatelessWidget {
  const _UserCreatePage();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateUserBloc, CreateUserState>(
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
      child: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _NameField(),
              SizedBox(height: 16.0),
              _LastNameField(),
              SizedBox(height: 16.0),
              _EmailField(),
              SizedBox(height: 16.0),
              _RoleSelection(),
              SizedBox(height: 32.0),
              _SubmittButton(),
            ],
          ),
        ),
      ),
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
            labelText: 'Last Name',
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

class _RoleSelection extends StatelessWidget {
  const _RoleSelection();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserBloc, CreateUserState>(
      buildWhen: (prev, curr) =>
          prev.selectedRoles != curr.selectedRoles || prev.roles != curr.roles,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Roles: '),
            const SizedBox(height: 8.0),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: state.roles.map((role) {
                return _RoleItem(
                  role: role,
                  isSelected: state.selectedRoles.contains(role),
                  onSelected: (value) {
                    context
                        .read<CreateUserBloc>()
                        .add(CreateUserRoleChanged(role));
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

class _RoleItem extends StatelessWidget {
  const _RoleItem({
    required this.role,
    this.isSelected = false,
    this.onSelected,
  });

  final Role role;
  final bool isSelected;
  final Function(Role)? onSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    final isTriggable = onSelected != null;

    return GestureDetector(
      onTap: isTriggable ? () => onSelected!(role) : null,
      child: AnimatedContainer(
        duration: Durations.medium1,
        decoration: BoxDecoration(
          color: isSelected ? GColor.primaryLight : GColor.surfaceLight,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Text(
          role.name,
          style: textTheme.bodyLarge?.copyWith(
            color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
