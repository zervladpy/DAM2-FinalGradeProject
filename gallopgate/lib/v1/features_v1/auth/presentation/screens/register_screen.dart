import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/common/controllers/auth_bloc/auth_bloc.dart';
import 'package:gallopgate/v1/config/extension/double.dart';
import 'package:gallopgate/v1/config/navigation/navigation.dart';
import 'package:gallopgate/v1/features_v1/auth/presentation/controllers/register_cubit/register_cubit.dart';
import 'package:gallopgate/v1/features_v1/auth/presentation/widgets/auth_error.dart';
import 'package:iconsax/iconsax.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const MaterialPage page = MaterialPage(child: RegisterScreen());

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
          create: (context) => RegisterCubit(),
          child: const _RegisterScreen(),
        ),
      ),
    );
  }
}

class _RegisterScreen extends StatelessWidget {
  const _RegisterScreen();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.0.paddingAll,
      child: const Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Create Account"),
              SizedBox(height: 32.0),
              _EmailField(),
              SizedBox(height: 16.0),
              _PasswordField(),
              SizedBox(height: 16.0),
              _RepeatPasswordField(),
              SizedBox(height: 16.0),
              _RegisterButton(),
              // Divider(),
              // _HaveAccountButton(),
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
    final cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email,
          onChanged: cubit.emailChanged,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.sms),
            labelText: 'Email',
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
    final cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.password,
          onChanged: cubit.passwordChanged,
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: 'Password',
          ),
        );
      },
    );
  }
}

class _RepeatPasswordField extends StatelessWidget {
  const _RepeatPasswordField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.repeatPassword,
          onChanged: cubit.repeatPasswordChanged,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.password_check),
            labelText: 'Repeat Password',
            errorText: state.repeatPasswordError.isEmpty
                ? null
                : state.repeatPasswordError,
          ),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (prev, curr) => prev != curr,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: AuthErrorText()),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                return ElevatedButton(
                  onPressed: _isButtonEnabled(state)
                      ? () => _onPressed(context)
                      : null,
                  child: authState.status == AuthStatus.loading
                      ? const CircularProgressIndicator()
                      : const Text("Create a Account"),
                );
              },
            ),
          ],
        );
      },
    );
  }

  bool _isButtonEnabled(RegisterState state) =>
      state.emailError.isEmpty &&
      state.passwordError.isEmpty &&
      state.email.isNotEmpty &&
      state.password.isNotEmpty &&
      state.repeatPassword.isNotEmpty &&
      state.repeatPasswordError.isEmpty;

  void _onPressed(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    final authBloc = context.read<AuthBloc>();

    authBloc.add(
      AuthRegisterEvent(
        cubit.state.email,
        cubit.state.password,
      ),
    );
  }
}

class _HaveAccountButton extends StatelessWidget {
  const _HaveAccountButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => navigateToLogin(context),
      child: const Text("Already have an account? Login"),
    );
  }
}
