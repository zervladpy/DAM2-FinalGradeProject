import 'package:flutter/material.dart';
import 'package:gallopgate/features/_common/widgets/appbar/appbar.dart';
import 'package:gallopgate/features/_common/widgets/separator/separator_large.dart';
import 'package:gallopgate/features/home/widgets/home_all_courses_card.dart';
import 'package:gallopgate/features/home/widgets/home_next_lesson_card.dart';
import 'package:gallopgate/features/home/widgets/home_notifications_icon_button.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Page<HomeScreen> get page => const MaterialPage(child: HomeScreen());

  @override
  Widget build(BuildContext context) {
    return const _HomeScreen();
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(
        title: Text("Home"),
        actions: [
          HomeNotificationsIconButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(GSizes.defaultSeparation),
          child: Column(
            children: [
              const HomeNextLessonCard(),
              LargeSeparator.vertical(),
              const HomeAllCoursesCard(),
            ],
          ),
        ),
      ),
    );
  }
}
