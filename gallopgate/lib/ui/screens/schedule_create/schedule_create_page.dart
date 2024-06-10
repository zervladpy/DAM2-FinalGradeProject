import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/ui/screens/schedule_create/bloc/create_schedule_bloc.dart';

class ScheduleCreatePage extends StatelessWidget {
  const ScheduleCreatePage(
    this.organizationId, {
    super.key,
  });

  static MaterialPage page(String organizationId) => MaterialPage(
        child: ScheduleCreatePage(organizationId),
      );

  final String organizationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (_) => CreateScheduleBloc(),
        child: const _ScheduleCreatePage(),
      ),
    );
  }
}

class _ScheduleCreatePage extends StatelessWidget {
  const _ScheduleCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
