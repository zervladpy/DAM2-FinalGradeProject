import 'package:flutter/material.dart';

class MultilineInputField extends StatelessWidget {
  const MultilineInputField({
    super.key,
    required this.label,
    this.initialValue = '',
    this.maxLines = 5,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.enabled = false,
  });

  final int maxLines;
  final int? maxLength;
  final String label;
  final String initialValue;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      initialValue: initialValue,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8.0,
        ),
      ),
      validator: validator,
      buildCounter: (
        context, {
        required currentLength,
        required isFocused,
        required maxLength,
      }) {
        if (maxLength == null) {
          return null;
        } else {
          return Text('$currentLength/$maxLength');
        }
      },
    );
  }
}
