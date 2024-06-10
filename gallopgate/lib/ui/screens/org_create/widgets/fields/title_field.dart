import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TitleField extends StatelessWidget {
  const TitleField({
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
      decoration: const InputDecoration(
        label: Text("Title"),
        prefixIcon: Icon(Iconsax.text),
      ),
    );
  }
}
