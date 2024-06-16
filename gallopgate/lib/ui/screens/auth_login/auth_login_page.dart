import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/data_validation.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/common/validators/validator.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:gallopgate/ui/screens/auth_login/bloc/login_bloc.dart';
import 'package:gallopgate/ui/screens/auth_login/widgets/auth_login.library.dart';
import 'package:go_router/go_router.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({super.key});

  static const page = MaterialPage(child: AuthLoginPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(locator.get()),
      child: Builder(builder: (context) {
        return BlocListener<LoginBloc, LoginState>(
          listenWhen: (prev, curr) => prev.status != curr.status,
          listener: (context, state) {
            if (state.status == Status.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: context.colorScheme.error,
                  content: Text(
                    state.error,
                    style: const TextStyle().copyWith(
                      color: context.colorScheme.onError,
                    ),
                  ),
                ),
              );
            } else if (state.status == Status.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green[400],
                  content: Text(
                    'Login successful',
                    style: const TextStyle().copyWith(
                      color: GColor.surfaceDark,
                    ),
                  ),
                ),
              );
            }
          },
          child: const Scaffold(
            body: _AuhtLoginPage(),
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
    return const CustomScrollView(
      slivers: [
        LoginAppBar(),
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              width: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _EmailField(),
                  SizedBox(height: 16.0),
                  _PasswordField(),
                  SizedBox(height: 8.0),
                  _ForgotPassword(),
                  SizedBox(height: 8.0),
                  _LoginButton(),
                  SizedBox(height: 16.0),
                  _RegisterButton(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = BlocProvider.of<LoginBloc>(context);

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (prev, curr) => prev.email != curr.email,
      builder: (context, state) {
        return EmailField(
          initialValue: state.email,
          onChanged: (v) => bloc.add(EmailChanged(v)),
          validator: validator,
        );
      },
    );
  }

  String? validator(String? value) {
    log('EmailField.validator: $value');
    return switch (GValidator.email(value)) {
      DataValidation.required => 'Email is required',
      DataValidation.emailInvalidFormat => 'Invalid email',
      _ => null,
    };
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (prev, curr) => prev.showPassword != curr.showPassword,
      builder: (context, state) {
        return PasswordField(
          initalValue: state.password,
          onChanged: (v) => bloc.add(PasswordChanged(v)),
          obscureText: (v) => bloc.add(ShowPasswordChanged(v)),
          obscured: state.showPassword,
          validator: validator,
        );
      },
    );
  }

  String? validator(String? value) {
    return switch (GValidator.password(value)) {
      DataValidation.required => 'Password is required',
      _ => null,
    };
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (prev, curr) => prev.status != curr.status,
          builder: (context, state) {
            return ForgotPasswordButton(
              enabled: state.status != Status.loading,
            );
          },
        ),
      ],
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        return LoginButton(
          enabled: state.status != Status.loading,
          loading: state.status == Status.loading,
          onSubmit: () => bloc.add(const LoginSubmitted()),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        return RegisterButton(
          enabled: state.status != Status.loading,
          onPressed: () => context.push('/auth/register'),
        );
      },
    );
  }
}
