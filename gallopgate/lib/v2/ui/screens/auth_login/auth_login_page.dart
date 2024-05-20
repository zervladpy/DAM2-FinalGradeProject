import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/config/locator/locator.dart';
import 'package:gallopgate/v2/ui/screens/auth_login/bloc/login_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({super.key});

  static const page = MaterialPage(child: AuthLoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(gLocator.get()),
      child: Builder(builder: (context) {
        return BlocListener<LoginBloc, LoginState>(
          listenWhen: (prev, curr) => prev.status != curr.status,
          listener: (context, state) {
            if (state.status == LoginStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  content: Text(
                    state.error,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onError,
                        ),
                  ),
                ),
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
            ),
            body: const _AuhtLoginPage(),
          ),
        );
      }),
    );
  }
}

class _AuhtLoginPage extends StatelessWidget {
  const _AuhtLoginPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _EmailField(),
              SizedBox(height: 16.0),
              _PasswordField(),
              SizedBox(height: 16.0),
              _LoginButton(),
              Divider(),
              _GoToRegister(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context.watch<LoginBloc>().state.email,
      onChanged: (value) {
        context.read<LoginBloc>().add(EmailChanged(value));
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Iconsax.sms),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: context.watch<LoginBloc>().state.password,
      onChanged: (value) {
        context.read<LoginBloc>().add(PasswordChanged(value));
      },
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Iconsax.password_check),
        suffixIcon: IconButton(
          icon: Icon(
            context.watch<LoginBloc>().state.showPassword
                ? Icons.visibility
                : Icons.visibility_off,
          ),
          onPressed: () {
            context.read<LoginBloc>().add(
                  ShowPasswordChanged(
                    !context.read<LoginBloc>().state.showPassword,
                  ),
                );
          },
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<LoginBloc>().add(const LoginSubmitted());
        },
        child: const Text('Login'));
  }
}

class _GoToRegister extends StatelessWidget {
  const _GoToRegister();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        context.go('/auth/register');
      },
      child: const Text("Don't have a account?"),
    );
  }
}
