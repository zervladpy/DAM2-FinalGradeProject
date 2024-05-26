import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/ui/screens/main_schedule/bloc/schedule_bloc.dart';
import 'package:gallopgate/ui/screens/main_schedule/widgets/schedule_day_page.dart';

class MainSchedulePage extends StatelessWidget {
  const MainSchedulePage({super.key});

  static const page = MaterialPage(child: MainSchedulePage());

  @override
  Widget build(BuildContext context) {
    final initialDay = DateTime.now().weekday - 1;

    return DefaultTabController(
      length: 7,
      initialIndex: initialDay,
      child: BlocProvider(
        create: (context) => ScheduleBloc(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Main Schedule Page'),
            bottom: const TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [
                Tab(text: 'Monday'),
                Tab(text: 'Tuesday'),
                Tab(text: 'Wednesday'),
                Tab(text: 'Thursday'),
                Tab(text: 'Friday'),
                Tab(text: 'Saturday'),
                Tab(text: 'Sunday'),
              ],
            ),
          ),
          body: const _MainSchedulePage(),
        ),
      ),
    );
  }
}

class _MainSchedulePage extends StatelessWidget {
  const _MainSchedulePage();

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        ScheduleDayPage(),
        ScheduleDayPage(),
        ScheduleDayPage(),
        ScheduleDayPage(),
        ScheduleDayPage(),
        ScheduleDayPage(),
        ScheduleDayPage(),
      ],
    );
  }
}
