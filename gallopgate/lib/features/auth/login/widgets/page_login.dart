import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/_common/controller/controller_auth/auth_cubit.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_default.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_large.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_small.dart';
import 'package:gallopgate/features/auth/login/controller/login/login_cubit.dart';
import 'package:gallopgate/utils/constraints/routes.dart';
import 'package:go_router/go_router.dart';

import 'login_button.dart';
import 'login_email_field.dart';
import 'login_forget_password_button.dart';
import 'login_header.dart';
import 'login_no_account_button.dart';
import 'login_password_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(() => _onLoginSuccess(context)),
      child: const _LoginPage(),
    );
  }

  void _onLoginSuccess(BuildContext context) {
    context.read<AuthCubit>().authenticate();
    context.go(GRoutes.home);
  }
}

class _LoginPage extends StatelessWidget {
  const _LoginPage();

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.read();

    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: cubit.state.key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Header(),
              LargeSeparator.vertical(),
              const EmailField(),
              DefaultSeparator.vertical(),
              const PasswordField(),
              SmallSeparator.vertical(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ForgetPasswordButton(),
                ],
              ),
              SmallSeparator.vertical(),
              const LoginButton(),
              LargeSeparator.vertical(),
              const NoAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}
