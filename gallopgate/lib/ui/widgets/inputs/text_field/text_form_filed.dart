import 'package:flutter/material.dart';

class GTextFormField extends StatelessWidget {
  const GTextFormField({
    super.key,
    this.initialValue = '',
    this.onscured = false,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.trailing,
    this.label,
    this.enabled = false,
  });

  final String initialValue;
  final bool onscured;
  final String? label;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final Widget? trailing;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      enabled: enabled,
      obscureText: onscured,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffix: trailing,
      ),
    );
  }
}
