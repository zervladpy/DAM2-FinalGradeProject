import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/common/enums/status.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/auth_register/bloc/register_bloc.dart';
import 'package:gallopgate/ui/widgets/snackbars/snackbar.dart';
import 'package:go_router/go_router.dart';
import 'widgets/auth_register.library.dart';

class AuthRegisterPage extends StatelessWidget {
  const AuthRegisterPage({super.key});

  static const page = MaterialPage(child: AuthRegisterPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(locator.get()),
      child: const Scaffold(
        body: _AuthRegisterPage(),
      ),
    );
  }
}

class _AuthRegisterPage extends StatelessWidget {
  const _AuthRegisterPage();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == Status.success) {
          GSnackbar.success(
            context: context,
            message: 'We sended you a confirmation Email',
          );
        } else if (state.status == Status.error) {
          log('Error: ${state.error}');
          GSnackbar.error(
            context: context,
            message: state.error ?? 'An error occured',
          );
        }
      },
      builder: (context, state) {
        return const CustomScrollView(
          slivers: [
            RegisterAppbar(),
            SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _EmailField(),
                    SizedBox(height: 16.0),
                    _PassowrdField(),
                    SizedBox(height: 16.0),
                    _RepeatPasswordField(),
                    SizedBox(height: 16.0),
                    _RegisterButton(),
                    SizedBox(height: 16.0),
                    _HaveAccountButton(),
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

class _EmailField extends StatelessWidget {
  const _EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RegisterBloc>(context);

    return EmailField(
      initialValue: bloc.state.email,
      onChanged: (value) => bloc.add(RegisterEmailChanged(value)),
    );
  }
}

class _PassowrdField extends StatelessWidget {
  const _PassowrdField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RegisterBloc>(context);

    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (prev, curr) => prev.showPassword != curr.showPassword,
      builder: (context, state) {
        return PasswordField(
          initalValue: state.password,
          onChanged: (value) => bloc.add(RegisterPasswordChanged(value)),
          obscured: state.showPassword,
          obscureText: (v) => bloc.add(RegisterShowPasswordChanged(v)),
        );
      },
    );
  }
}

class _RepeatPasswordField extends StatelessWidget {
  const _RepeatPasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<RegisterBloc>(context);

    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (prev, curr) => prev.showPassword != curr.showPassword,
      builder: (context, state) {
        return RepeatPasswordField(
          initalValue: state.repeatPassword,
          onChanged: (value) => bloc.add(RegisterRepeatPasswordChanged(value)),
          obscured: state.showPassword,
          obscureText: (v) => bloc.add(RegisterShowPasswordChanged(v)),
        );
      },
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        return RegisterButton(
          enabled: state.status != Status.loading,
          loading: state.status == Status.loading,
          onPressed: () {
            context.read<RegisterBloc>().add(const RegisterSubmitted());
          },
        );
      },
    );
  }
}

class _HaveAccountButton extends StatelessWidget {
  const _HaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        return HaveAccountButton(
          enabeld: state.status != Status.loading,
          onPressed: () {
            context.push('/auth/login');
          },
        );
      },
    );
  }
}
