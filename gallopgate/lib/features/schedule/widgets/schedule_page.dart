import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({
    super.key,
    required this.weekDayPages,
  });

  final List<Widget> weekDayPages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(GSizes.separationSm),
      child: TabBarView(
        children: weekDayPages,
      ),
    );
  }
}
