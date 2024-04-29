import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/_common/widgets/input/form_text_field.dart';
import 'package:gallopgate/features/auth/login/controller/login/login_cubit.dart';
import 'package:gallopgate/utils/validator/input_error.dart';
import 'package:gallopgate/utils/validator/input_validator.dart';
import 'package:iconsax/iconsax.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

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
