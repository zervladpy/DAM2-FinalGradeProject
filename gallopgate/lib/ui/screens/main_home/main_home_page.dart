import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';

import 'widgets/home_sliver_appbar.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  static const page = MaterialPage(child: MainHomePage());

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<MainBloc>().state.profile;
    final organization = context.watch<MainBloc>().state.organization;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeSliverAppbar(profile: profile, organization: organization),
          const SliverToBoxAdapter(
            child: Placeholder(),
          ),
          const SliverToBoxAdapter(
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
