import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RepeatPasswordField extends StatelessWidget {
  const RepeatPasswordField({
    super.key,
    required this.initalValue,
    this.onChanged,
    this.validator,
    this.obscureText,
    this.obscured = true,
  });

  final String initalValue;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(bool)? obscureText;
  final bool obscured;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initalValue,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscured,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Iconsax.password_check),
        suffixIcon: IconButton(
          icon: Icon(
            obscured ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () => obscureText?.call(!obscured),
        ),
      ),
    );
  }
}
