import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/common/controllers/auth_bloc/auth_bloc.dart';
import 'package:gallopgate/v1/common/controllers/cache_bloc/cache_bloc.dart';
import 'package:gallopgate/v1/common/domain/models/auth_user.dart';
import 'package:gallopgate/v1/common/domain/models/user.dart';
import 'package:gallopgate/v1/common/domain/use_cases/user/update_user_use_case.dart';
import 'package:gallopgate/v1/config/extension/double.dart';
import 'package:gallopgate/v1/config/locator/locator.dart';
import 'package:gallopgate/v1/features_v1/user_details/presentation/controllers/user_details_cubit/user_details_cubit.dart';
import 'package:iconsax/iconsax.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthUser authUser = context.read<AuthBloc>().state.user;
    User user = context.read<CacheBloc>().state.user;

    if (user.isEmpty) {
      user = user.copyWith(
        id: authUser.id,
        email: authUser.email,
      );
    }

    return BlocProvider(
      create: (context) => UserDetailsCubit(
        user,
        UpdateUserUseCase(gLocator.get()),
      ),
      child: const _UserDetailScreen(),
    );
  }
}

class _UserDetailScreen extends StatelessWidget {
  const _UserDetailScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 16.0.paddingAll,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _NameField(),
              SizedBox(height: 16),
              _UpdateButton(),
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
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      buildWhen: (prev, curr) => prev.name != curr.name,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.name,
          onChanged: context.read<UserDetailsCubit>().updateName,
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.user),
            labelText: 'Name',
          ),
        );
      },
    );
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserDetailsCubit>();

    return ElevatedButton(
      onPressed: cubit.isValidForUpdate() ? () {} : null,
      child: const Text("Update"),
    );
  }
}
