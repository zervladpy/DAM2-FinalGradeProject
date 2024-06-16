import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    this.initialValue = '',
    this.onChanged,
    this.validator,
  });

  final String initialValue;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Iconsax.sms),
      ),
    );
  }
}
