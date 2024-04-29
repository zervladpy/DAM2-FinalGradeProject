import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/_common/widgets/input/form_text_field.dart';
import 'package:gallopgate/features/auth/login/controller/login/login_cubit.dart';
import 'package:gallopgate/utils/validator/input_error.dart';
import 'package:gallopgate/utils/validator/input_validator.dart';
import 'package:iconsax/iconsax.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

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
