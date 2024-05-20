import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/common/controllers/auth_bloc/auth_bloc.dart';
import 'package:gallopgate/v1/config/extension/double.dart';
import 'package:gallopgate/v1/config/navigation/navigation.dart';
import 'package:gallopgate/v1/features_v1/auth/presentation/controllers/login_cubit/login_cubit.dart';
import 'package:gallopgate/v1/features_v1/auth/presentation/widgets/auth_error.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          navigateToHome(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => LoginCubit(),
          child: const _LoginScreen(),
        ),
      ),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.0.paddingAll,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Login"),
              const SizedBox(height: 32.0),
              const _EmailField(),
              const SizedBox(height: 16.0),
              const _PasswordField(),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Forgot Password"),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const _LoginButton(),
              const Divider(),
              const _DontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DontHaveAccount extends StatelessWidget {
  const _DontHaveAccount();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => navigateToRegister(context),
      child: const Text("Create a account"),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.email != current.email ||
          previous.emailError != current.emailError,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email,
          onChanged: cubit.onEmailChanged,
          decoration: InputDecoration(
            labelText: "Email",
            prefixIcon: const Icon(Iconsax.sms),
            errorText: state.emailError.isEmpty ? null : state.emailError,
          ),
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.passwordError != current.passwordError,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.password,
          onChanged: cubit.onPasswordChanged,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            prefixIcon: const Icon(Iconsax.password_check),
            errorText: state.passwordError.isEmpty ? null : state.passwordError,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AuthErrorText(),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                return ElevatedButton(
                  onPressed: _isButtonEnabled(state)
                      ? () => _onPressed(context)
                      : null,
                  child: authState.status == AuthStatus.loading
                      ? const CircularProgressIndicator()
                      : const Text("Login"),
                );
              },
            ),
          ],
        );
      },
    );
  }

  bool _isButtonEnabled(LoginState state) =>
      state.emailError.isEmpty &&
      state.passwordError.isEmpty &&
      state.email.isNotEmpty &&
      state.password.isNotEmpty;

  void _onPressed(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final authBloc = context.read<AuthBloc>();

    authBloc.add(AuthLoginEvent(cubit.state.email, cubit.state.password));
  }
}
