import 'package:flutter/material.dart';

class GTextFormField extends StatelessWidget {
  const GTextFormField({
    super.key,
    this.label,
    this.placeholder,
    this.onChange,
    this.leadingIcon,
    this.trailing,
    this.validator,
    this.isVisible,
    this.keyboardType,
  });

  final String? label, placeholder;
  final void Function(String value)? onChange;
  final String? Function(String? value)? validator;
  final bool? isVisible;
  final TextInputType? keyboardType;

  final IconData? leadingIcon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: label,
        hintText: placeholder,
        prefixIcon: leadingIcon != null ? Icon(leadingIcon) : null,
        suffixIcon: trailing,
      ),
      obscureText: isVisible ?? false,
      onChanged: onChange,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      cursorColor: Theme.of(context).colorScheme.onBackground,
      cursorWidth: 1.0,
    );
  }
}
