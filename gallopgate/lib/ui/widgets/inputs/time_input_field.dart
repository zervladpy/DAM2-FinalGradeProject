import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TimeInputField extends StatelessWidget {
  const TimeInputField({
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
    return SizedBox(
      height: 50.0,
      width: 100.0,
      child: TextFormField(
        initialValue: initialValue,
        onChanged: onChange,
        expands: false,
        enabled: false,
        onTap: () => _showTimePicker(context),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Iconsax.clock),
        ),
      ),
    );
  }

  Future<void> _showTimePicker(BuildContext context) async {
    await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
    );
  }
}
