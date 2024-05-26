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
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: 5.0,
          runSpacing: 5.0,
          children: [
            const Row(
              children: [
                TimeInputField(label: "Start"),
                TimeInputField(label: "Duration"),
              ],
            ),
            const Row(
              children: [
                Text("Insturctor"),
                Text("Riders"),
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
        ),
      ],
    );
  }
}
