import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/ui/screens/loading_page/loading_page.dart';
import 'package:gallopgate/ui/screens/main_manage/bloc/manage_bloc.dart';
import 'package:gallopgate/ui/screens/main_manage/widgets/content/manage_horses_content.dart';
import 'package:gallopgate/ui/screens/main_manage/widgets/content/manage_lessons_content.dart';
import 'package:gallopgate/ui/screens/main_manage/widgets/content/manage_profiles_content.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';

class MainManagePage extends StatelessWidget {
  const MainManagePage({super.key});

  static const page = MaterialPage(child: MainManagePage());

  @override
  Widget build(BuildContext context) {
    final organizationId = context.read<MainBloc>().state.organization.id;

    log('Organization ID from main manage: $organizationId');

    return BlocProvider(
      create: (context) => ManageBloc(
        organizationId: organizationId,
        profileRepository: locator.get(),
        lectureRepository: locator.get(),
      )..add(const ManageEventInitialize()),
      child: const _MainManagePage(),
    );
  }
}

class _MainManagePage extends StatelessWidget {
  const _MainManagePage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageBloc, ManageState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        if (state.status == ManageStatus.loading) {
          return const LoadingPage();
        }

        if (state.status == ManageStatus.failure) {
          return const Center(child: Text('Failed to load profiles'));
        }

        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Manage'),
              bottom: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: 'Users'),
                  Tab(text: 'Horses'),
                  Tab(text: 'Lessons'),
                ],
              ),
            ),
            body: const _ManagePageContent(),
          ),
        );
      },
    );
  }
}

class _ManagePageContent extends StatelessWidget {
  const _ManagePageContent();

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [
        ManageProfilesContent(),
        ManageHorsesContent(),
        ManageLessonsContent(),
      ],
    );
  }
}
