import 'package:flutter/material.dart';
import 'package:gallopgate/models/schedule/schedule.dart';
import 'package:gallopgate/ui/screens/lesson_create/widgets/schedule_item.dart';

class ScheduleDayItem extends StatelessWidget {
  const ScheduleDayItem({
    super.key,
    this.items = const [],
    this.onAdd,
    this.onRemove,
    this.onItemChanged,
  });

  final List<Schedule> items;
  final void Function()? onAdd;
  final void Function(Schedule item)? onRemove;
  final void Function(Schedule item)? onItemChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ElevatedButton(
            onPressed: onAdd,
            child: const Text("Add Schedule"),
          ),
          if (items.isNotEmpty) const SizedBox(height: 16.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ScheduleItem(
                  key: ValueKey(item.id),
                  item: item,
                  onChange: onItemChanged,
                  onDelete: onRemove,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
