import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:gallopgate/ui/screens/main_calendar/bloc/calendar_bloc.dart';
import 'package:gallopgate/ui/screens/main_calendar/widgets/calendar_sliver_appbar.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendarPage extends StatelessWidget {
  const MainCalendarPage({super.key});

  static const page = MaterialPage(child: MainCalendarPage());

  @override
  Widget build(BuildContext context) {
    final Profile profile = context.watch<MainBloc>().state.profile;
    final Organization organization =
        context.watch<MainBloc>().state.organization;

    final bool isAdmin = profile.roles.any((r) => r.name == 'admin');

    return BlocProvider(
      create: (context) => CalendarBloc(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CalendarSliverAppbar(
              organization: organization,
              isAdmin: isAdmin,
            ),
            const SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: _MainCalendarPage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainCalendarPage extends StatelessWidget {
  const _MainCalendarPage();

  @override
  Widget build(BuildContext context) {
    final initalDate = DateTime.now();
    final firstDate = DateTime.now().subtract(const Duration(days: 365));
    final lastDate = DateTime.now().add(const Duration(days: 365));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TableCalendar(
          startingDayOfWeek: StartingDayOfWeek.monday,
          focusedDay: initalDate,
          firstDay: firstDate,
          lastDay: lastDate,
          headerStyle: const HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
          ),
        ),
        const SizedBox(height: 16.0),
        const Text("Events: "),
        const SizedBox(height: 8.0),
        const Text("No events")
      ],
    );
  }
}
