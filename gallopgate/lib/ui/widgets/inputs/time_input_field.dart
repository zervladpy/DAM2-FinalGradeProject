import 'package:flutter/material.dart';
import 'package:gallopgate/common/utils/date_utils.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';
import 'package:iconsax/iconsax.dart';

class TimeInputField extends StatelessWidget {
  const TimeInputField({
    super.key,
    this.time,
    this.onTimeChanged,
  });

  final DateTime? time;
  final void Function(DateTime)? onTimeChanged;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return GestureDetector(
      onTap: () => _showTimePicker(context),
      child: Container(
        width: 130,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: GColor.primaryLight.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Iconsax.clock_1),
            const SizedBox(width: 16),
            Text(
              GDateUtils.formatTimeToString(time ?? now),
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showTimePicker(BuildContext context) async {
    final TimeOfDay initial = time == null
        ? TimeOfDay.now()
        : TimeOfDay(hour: time!.hour, minute: time!.minute);

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.inputOnly,
      initialTime: initial,
    );

    if (picked != null && onTimeChanged != null) {
      onTimeChanged!(DateTime(
        picked.hour,
        picked.minute,
      ));
    }
  }
}
