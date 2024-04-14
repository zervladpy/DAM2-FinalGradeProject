import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/_common/widgets/input/form_text_field.dart';
import 'package:gallopgate/features/_common/widgets/logo/logo.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_default.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_large.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_small.dart';
import 'package:gallopgate/features/auth/signup/controller/signup/signup_cubit.dart';
import 'package:gallopgate/utils/validator/input_error.dart';
import 'package:gallopgate/utils/validator/input_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(context),
      child: const _SignupPage(),
    );
  }
}

class _SignupPage extends StatelessWidget {
  const _SignupPage();

  @override
  Widget build(BuildContext context) {
    SignupCubit cubit = context.read();

    return Form(
      key: cubit.state.key,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _Header(),
              LargeSeparator.vertical(),
              const _EmailField(),
              DefaultSeparator.vertical(),
              const _PasswordField(),
              DefaultSeparator.vertical(),
              const _RepeatPasswordField(),
              SmallSeparator.vertical(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _HaveAccountButton(),
                ],
              ),
              SmallSeparator.vertical(),
              const _SignupButton(),
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
      children: [
        const GLogo(),
        DefaultSeparator.horizontal(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "GallopGate",
              style: Theme.of(context).textTheme.headlineLarge,
            )
          ],
        ),
      ],
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    SignupCubit cubit = context.read();

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return GTextFormField(
          label: "Email",
          leadingIcon: Iconsax.sms,
          onChange: cubit.onEmailChange,
          validator: (value) => _validate(context, value),
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }

  String? _validate(BuildContext context, String? value) {
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
    SignupCubit cubit = context.read();

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return GTextFormField(
          label: "Password",
          leadingIcon: Iconsax.password_check,
          onChange: cubit.onPasswordChange,
          validator: (value) => _validate(context, value),
          keyboardType: TextInputType.visiblePassword,
          trailing: IconButton(
            onPressed: cubit.changePasswordVisibility,
            icon:
                Icon(state.isPasswordVisible ? Iconsax.eye : Iconsax.eye_slash),
          ),
        );
      },
    );
  }

  String? _validate(BuildContext context, String? value) {
    InputError error = InputValidator.validatePassword(value ?? '');

    return switch (error) {
      InputError.required => "Required",
      _ => null,
    };
  }
}

class _RepeatPasswordField extends StatelessWidget {
  const _RepeatPasswordField();

  @override
  Widget build(BuildContext context) {
    SignupCubit cubit = context.read();

    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return GTextFormField(
          label: "Password",
          leadingIcon: Iconsax.password_check,
          keyboardType: TextInputType.visiblePassword,
          onChange: cubit.onPasswordChange,
          validator: (value) => _validator(context, value),
          isVisible: !cubit.state.isPasswordVisible,
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

class _HaveAccountButton extends StatelessWidget {
  const _HaveAccountButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pop(),
      child: const Text('Have account?'),
    );
  }
}

class _SignupButton extends StatelessWidget {
  const _SignupButton();

  @override
  Widget build(BuildContext context) {
    SignupCubit cubit = context.read();

    return ElevatedButton.icon(
      onPressed: cubit.onSignup,
      icon: const Icon(Iconsax.add),
      label: const Text('Create Account'),
    );
  }
}
