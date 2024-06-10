import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/inputs/multiline_input_field.dart';

class DescriptionTextField extends StatelessWidget {
  const DescriptionTextField({
    super.key,
    this.initialValue = '',
    this.onChanged,
    this.validator,
  });

  final String initialValue;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return MultilineInputField(
      label: "Description",
      initialValue: '',
      maxLength: 250,
      maxLines: 5,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
