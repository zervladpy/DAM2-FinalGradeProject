import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/ui/screens/main_schedule/widgets/schedule_sliver_appbar.dart';
import 'package:gallopgate/ui/screens/main_schedule/widgets/schedule_tabbar.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';

class MainSchedulePage extends StatelessWidget {
  const MainSchedulePage({super.key});

  static const page = MaterialPage(child: MainSchedulePage());

  @override
  Widget build(BuildContext context) {
    final initialDay = DateTime.now().weekday - 1;

    final MainBloc mainBloc = context.read<MainBloc>();

    final profile = mainBloc.state.profile;
    final organization = mainBloc.state.organization;

    final isAdmin = profile.roles.any((r) => r.name == 'admin');

    final List<String> tabs = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    return Scaffold(
      body: DefaultTabController(
        length: tabs.length,
        initialIndex: initialDay,
        child: CustomScrollView(
          slivers: [
            ScheduleSliverAppbar(organization: organization, isAdimin: isAdmin),
            const SliverToBoxAdapter(child: SizedBox(height: 8.0)),
            ScheduleSliverTabBar(tabs: tabs),
            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            const SliverFillRemaining(child: Placeholder())
          ],
        ),
      ),
    );
  }
}
