import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/repositories/profile_repository.dart';
import 'package:gallopgate/ui/screens/error_not_found/error_not_found_page.dart';
import 'package:gallopgate/ui/screens/loading_page/loading_page.dart';
import 'package:gallopgate/ui/screens/user_edit/bloc/user_edit_bloc.dart';
import 'package:iconsax/iconsax.dart';

class UserEditPage extends StatelessWidget {
  const UserEditPage({
    super.key,
    required this.profileId,
  });

  final String profileId;

  static page(String profileId) => MaterialPage(
        child: UserEditPage(profileId: profileId),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserEditBloc(
        locator.get<ProfileRepository>(),
      )..add(UserEditFetch(profileId)),
      child: const _UserEditPage(),
    );
  }
}

class _UserEditPage extends StatelessWidget {
  const _UserEditPage();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserEditBloc, UserEditState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == Status.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
            ),
          );
        } else if (state.status == Status.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Profile updated successfully'),
            ),
          );
        }
      },
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        if (state.status == Status.loading) return const LoadingPage();
        if (state.status == Status.error) return const ErrorNotFoundPage();
        return const _UserEditContnet();
      },
    );
  }
}

class _UserEditContnet extends StatelessWidget {
  const _UserEditContnet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _FirstNameField(),
              SizedBox(height: 16.0),
              _LastNameField(),
              SizedBox(height: 16.0),
              _EmailField(),
              SizedBox(height: 16.0),
              _SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FirstNameField extends StatelessWidget {
  const _FirstNameField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context.watch<UserEditBloc>().state.profile.firstName,
      onChanged: (value) {
        context.read<UserEditBloc>().add(UserEditFirstNameChanged(value));
      },
      decoration: const InputDecoration(
        labelText: 'First Name',
        prefixIcon: Icon(Iconsax.tag_2),
      ),
    );
  }
}

class _LastNameField extends StatelessWidget {
  const _LastNameField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context.watch<UserEditBloc>().state.profile.lastName,
      onChanged: (value) {
        context.read<UserEditBloc>().add(UserEditLastNameChanged(value));
      },
      decoration: const InputDecoration(
        labelText: 'Last Name',
        prefixIcon: Icon(Iconsax.tag_2),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context.watch<UserEditBloc>().state.profile.email,
      enabled: false,
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Iconsax.sms),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<UserEditBloc>().add(const UserEditUpdateSubmit());
      },
      child: const Text('Update'),
    );
  }
}
