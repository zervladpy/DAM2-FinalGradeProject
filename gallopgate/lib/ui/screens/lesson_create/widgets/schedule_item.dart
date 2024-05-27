import 'package:flutter/material.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/models/schedule/schedule.dart';
import 'package:gallopgate/ui/widgets/inputs/time_input_field.dart';
import 'package:iconsax/iconsax.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({
    super.key,
    required this.item,
    this.onChange,
    this.onDelete,
  });

  final Schedule item;
  final Function(Schedule item)? onChange;
  final Function(Schedule item)? onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                TimeInputField(
                  label: "Start",
                  initialValue: item.startTime,
                  onChange: (newDate) {
                    var copy = item.copyWith(startTime: newDate);
                    onChange?.call(copy);
                  },
                ),
                const SizedBox(width: 16.0),
                TimeInputField(
                  label: "Duration",
                  initialValue: item.end,
                  onChange: (newDate) {
                    var copy = item.copyWith(startTime: newDate);
                    onChange?.call(copy);
                  },
                ),
              ],
            ),
            const Row(
              children: [
                Text("Insturctor"),
                Text("Riders"),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () => onDelete?.call(item),
          icon: Icon(
            Iconsax.trash,
            color: context.colorScheme.onError,
          ),
        ),
      ],
    );
  }
}
