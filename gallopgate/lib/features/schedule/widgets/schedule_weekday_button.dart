import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/text/text.dart';

class ScheduleWeekdayButton extends StatelessWidget {
  const ScheduleWeekdayButton({
    super.key,
    required this.title,
    this.selected,
    this.onTap,
  });

  final bool? selected;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return selected != null || selected == true
        ? ElevatedButton(
            onPressed: () {},
            child: GText(text: title),
          )
        : OutlinedButton(
            onPressed: onTap,
            child: GText(text: title),
          );
  }
}
