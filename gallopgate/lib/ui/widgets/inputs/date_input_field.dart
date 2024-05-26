import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DateInputField extends StatelessWidget {
  const DateInputField({
    super.key,
    required this.label,
    this.initialValue = '',
    this.onChange,
  });

  final String label;
  final String initialValue;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChange,
      onTap: () => _showDatePicker(context),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Iconsax.calendar),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: DateTime.now(),
    );
  }
}
