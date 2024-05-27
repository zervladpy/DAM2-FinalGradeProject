import 'package:flutter/material.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:iconsax/iconsax.dart';

class TimeInputField extends StatelessWidget {
  const TimeInputField({
    super.key,
    required this.label,
    required this.initialValue,
    this.onChange,
  });

  final String label;
  final DateTime initialValue;
  final Function(DateTime)? onChange;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: context.colorScheme.surfaceContainer,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        minimumSize: const Size(120.0, 60.0),
        maximumSize: const Size(120.0, 60.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () => _showTimePicker(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Iconsax.clock),
          const SizedBox(width: 8.0),
          Text(GDateUtils.formatTimeToString(initialValue)),
        ],
      ),
    );
  }

  Future<void> _showTimePicker(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
    );

    if (time != null) {
      DateTime currentDate = DateTime.now();

      DateTime date = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        time.hour,
        time.minute,
      );

      onChange?.call(date);
    }
  }
}
