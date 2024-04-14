import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/appbar/appbar.dart';
import 'package:iconsax/iconsax.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  static Page<ScheduleScreen> get page =>
      const MaterialPage(child: ScheduleScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GAppBar(
        title: const Text("Schedule"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.calendar),
          )
        ],
      ),
    );
  }
}
