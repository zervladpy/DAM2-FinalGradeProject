import 'package:flutter/material.dart';
import 'package:gallopgate/features/main_shell/presentation/pages/home/widgets/home_appbar.dart';
import 'package:gallopgate/features/main_shell/presentation/pages/home/widgets/home_future_events_container.dart';

class PageHomeScreen extends StatelessWidget {
  const PageHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeFutureEventsContainer()
          ],
        ),
      ),
    );
  }
}
