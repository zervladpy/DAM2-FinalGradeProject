import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/common/controllers/cache_bloc/cache_bloc.dart';
import 'package:gallopgate/v1/common/widgets/loading/loading.dart';
import 'package:gallopgate/v1/config/navigation/navigation.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/controllers/navigation_cubit/navigation_cubit.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/pages/account_page.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/pages/calendar_page.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/pages/dashboard_page.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/pages/managment_page.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/pages/schedule_screen.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/widgets/navigation/bottom_navigation.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/widgets/navigation/lateral_navigation.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/widgets/navigation/navigation_item.dart';
import 'package:gallopgate/v1/resources/enums/role.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CacheBloc, CacheState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == CacheStatus.loaded) {
          if (state.organization.isEmpty) {
            navigateToCreateOrganization(context);
          }
          if (state.user.isEmpty) {
            navigateToLogin(context);
          }
        }

        log(state.user.toString());
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationCubit()),
        ],
        child: BlocBuilder<CacheBloc, CacheState>(
          buildWhen: (prev, curr) => prev.status != curr.status,
          builder: (context, state) {
            if (state.status == CacheStatus.loading) {
              return const LoadingScreen();
            }
            return const _HomeScreen();
          },
        ),
      ),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    bool isAdmin =
        context.read<CacheBloc>().state.user.roles.contains(Role.admin);

    final useNavigationRail = MediaQuery.sizeOf(context).width >= 600;

    final List<NavigationItem> navigationItems =
        _navigationItems(context, isAdmin);

    final List<Widget> pages = _pages(context, isAdmin);

    return Scaffold(
      body: Row(
        children: [
          if (useNavigationRail)
            LateralNavigation(
              items: navigationItems,
            ),
          Expanded(
            child: FadeTransition(
              opacity: const AlwaysStoppedAnimation(1),
              child: pages[context.watch<NavigationCubit>().state.index],
            ),
          )
        ],
      ),
      bottomNavigationBar: useNavigationRail
          ? null
          : BottomNavigation(
              items: navigationItems,
            ),
    );
  }

  List<NavigationItem> _navigationItems(BuildContext context, bool isAdmin) {
    return [
      const NavigationItem(
        label: "Home",
        icon: Iconsax.home,
        iconSelected: Iconsax.home,
      ),
      const NavigationItem(
        label: "Calendar",
        icon: Iconsax.calendar,
        iconSelected: Iconsax.calendar,
      ),
      const NavigationItem(
        label: "Schedule",
        icon: Iconsax.calendar_1,
        iconSelected: Iconsax.calendar_1,
      ),
      if (isAdmin)
        const NavigationItem(
          label: "Manage",
          icon: Iconsax.setting_3,
          iconSelected: Iconsax.setting_3,
        ),
      const NavigationItem(
        label: "Account",
        icon: Iconsax.user,
        iconSelected: Iconsax.user,
      ),
    ];
  }

  List<Widget> _pages(BuildContext context, bool isAdmin) {
    return [
      const DashboardPage(),
      const CalendarPage(),
      const SchedulePage(),
      if (isAdmin) const ManagmentPage(),
      const AccountPage(),
    ];
  }
}
