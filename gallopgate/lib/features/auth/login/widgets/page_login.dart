import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/_common/controller/controller_auth/auth_cubit.dart';
import 'package:gallopgate/features/_common/widgets/input/form_text_field.dart';
import 'package:gallopgate/features/_common/widgets/logo/logo.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_default.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_large.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_small.dart';
import 'package:gallopgate/features/_common/widgets/text/text.dart';
import 'package:gallopgate/features/auth/login/controller/login/login_cubit.dart';
import 'package:gallopgate/utils/constraints/routes.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';
import 'package:gallopgate/utils/enums/fetch_state.dart';
import 'package:gallopgate/utils/validator/input_error.dart';
import 'package:gallopgate/utils/validator/input_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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
              const _Header(),
              LargeSeparator.vertical(),
              const _EmailField(),
              DefaultSeparator.vertical(),
              const _PasswordField(),
              SmallSeparator.vertical(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _ForgetPasswordButton(),
                ],
              ),
              SmallSeparator.vertical(),
              const _LoginButton(),
              LargeSeparator.vertical(),
              const _NoAccountButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // --- Logo --- //
        const GLogo(),
        SmallSeparator.horizontal(),
        // ---App Name and Small page description --- //
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "GallopGate",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SmallSeparator.vertical(),
            Text(
              "Welcome Back!",
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        )
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.read();

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return GTextFormField(
          label: "Email",
          leadingIcon: Iconsax.sms,
          keyboardType: TextInputType.emailAddress,
          onChange: cubit.onEmailChange,
          validator: (value) => _validator(context, value),
        );
      },
    );
  }

  String? _validator(BuildContext context, String? value) {
    InputError error = InputValidator.emailValidation(value ?? '');

    return switch (error) {
      InputError.required => "Required",
      _ => null,
    };
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField();

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.read();

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (prev, curr) =>
          prev.password != curr.password ||
          prev.passwordVisible != curr.passwordVisible,
      builder: (context, state) {
        return GTextFormField(
          label: "Password",
          leadingIcon: Iconsax.password_check,
          keyboardType: TextInputType.visiblePassword,
          onChange: cubit.onPasswordChange,
          validator: (value) => _validator(context, value),
          isVisible: !cubit.state.passwordVisible,
          trailing: IconButton(
            onPressed: cubit.onChangeVisibility,
            icon: Icon(state.passwordVisible ? Iconsax.eye : Iconsax.eye_slash),
          ),
        );
      },
    );
  }

  String? _validator(BuildContext context, String? value) {
    InputError error = InputValidator.validatePassword(value ?? '');

    return switch (error) {
      InputError.required => "Required",
      _ => null,
    };
  }
}

class _ForgetPasswordButton extends StatelessWidget {
  const _ForgetPasswordButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextButton(
          onPressed: () {},
          child: const Text("forgot the password?"),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.read();

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status || prev.error != curr.error,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.status == FetchStatus.initial)
              ElevatedButton.icon(
                onPressed: cubit.onLogin,
                label: const GText(text: "Login"),
                icon: const Icon(Iconsax.login),
              ),
            if (state.status == FetchStatus.loading)
              SizedBox(
                height: GSizes.defaultHeight,
                width: GSizes.defaultHeight,
                child: const LinearProgressIndicator(),
              ),
            if (state.error.isNotEmpty)
              Column(
                children: [
                  SmallSeparator.vertical(),
                  Text(
                    state.error,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Theme.of(context).colorScheme.error),
                  ),
                ],
              )
          ],
        );
      },
    );
  }
}

class _NoAccountButton extends StatelessWidget {
  const _NoAccountButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.push(GRoutes.signup),
      child: const Text("Don't have account?"),
    );
  }
}
