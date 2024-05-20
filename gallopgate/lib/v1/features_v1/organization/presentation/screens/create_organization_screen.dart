import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/common/controllers/cache_bloc/cache_bloc.dart';
import 'package:gallopgate/v1/common/domain/use_cases/organization/create_organization_use_case.dart';
import 'package:gallopgate/v1/common/domain/use_cases/organization/fetch_organizations_usecase.dart';
import 'package:gallopgate/v1/config/extension/double.dart';
import 'package:gallopgate/v1/config/locator/locator.dart';
import 'package:gallopgate/v1/features_v1/organization/presentation/controllers/bloc/join_organization_bloc.dart';
import 'package:gallopgate/v1/features_v1/organization/presentation/controllers/create_organization_cubit/create_organization_cubit.dart';
import 'package:gallopgate/v1/features_v1/organization/presentation/screens/create_organization_page.dart';
import 'package:gallopgate/v1/features_v1/organization/presentation/screens/join_organization_page.dart';

class CreateOrganizationScreen extends StatelessWidget {
  const CreateOrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateOrganizationCubit(
            context.read<CacheBloc>().state.user,
            CreateOrganizationUseCase(
              gLocator.get(),
              gLocator.get(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => JoinOrganizationBloc(
            FetchOrgaizationsUsecase(gLocator.get()),
          )..add(JoinOrganizationInitialize()),
        ),
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Create Organization'),
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Join',
                  ),
                  Tab(
                    text: 'Create',
                  ),
                ],
              ),
            ),
          ),
          body: const _CreateOrganizationScreen(),
        ),
      ),
    );
  }
}

class _CreateOrganizationScreen extends StatelessWidget {
  const _CreateOrganizationScreen();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.0.paddingAll,
      child: const TabBarView(
        children: [
          JoinOrganizationPage(),
          CreateOrganizationPage(),
        ],
      ),
    );
  }
}
