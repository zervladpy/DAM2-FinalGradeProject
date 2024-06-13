import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/config/dependency_injection/locator_intializer.dart';
import 'package:gallopgate/repositories/auth_repository.dart';
import 'package:gallopgate/ui/screens/error_not_found/error_not_found_page.dart';
import 'package:gallopgate/ui/screens/loading_page/loading_page.dart';
import 'package:gallopgate/ui/widgets/navigation/bottom_navigation.dart';
import 'package:gallopgate/ui/widgets/navigation/lateral_navigation.dart';
import 'package:gallopgate/ui/widgets/navigation/navigation_item.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/main_bloc/main_bloc.dart';
import 'package:gallopgate/ui/wrappers/main_wrapper/naviagation_cubit/navigation_cubit.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({
    super.key,
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Map<int, String> mainRoutes = {
      0: '/home',
      1: '/calendar',
      2: '/schedule',
      3: '/managment',
      4: '/account',
    };

    final int initialIndex = mainRoutes.values.toList().indexOf(
          state.matchedLocation,
        );

    final String profileId = locator.get<AuthRepository>().currentProfile!.id!;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(
            context: context,
            routerState: state,
            routes: mainRoutes,
            initialIndex: initialIndex,
          ),
        ),
        BlocProvider(
          create: (context) => MainBloc(
            profileRepository: locator.get(),
            organizationRepository: locator.get(),
            lectureRepository: locator.get(),
          )..add(MainEventInitialize(profileId)),
        )
      ],
      child: _MainWrapper(child, state),
    );
  }
}

class _MainWrapper extends StatelessWidget {
  const _MainWrapper(this.child, this.state);

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    final useNavigationRail = MediaQuery.of(context).size.width > 600;
    final isAdmin = context.watch<MainBloc>().state.profile.roles.map((e) {
      log(e.name);
      return e.name;
    }).contains('admin');
    final navigationItems = _navigationItems(isAdmin);

    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (prev, curr) => prev.status != curr.status,
      builder: (context, state) {
        if (state.status == MainStatus.loading) {
          return const LoadingPage();
        }

        if (state.status == MainStatus.failure) {
          return const ErrorNotFoundPage();
        }

        return Scaffold(
          body: Row(
            children: [
              if (useNavigationRail)
                LateralNavigation(
                  onItemSelected: (index) => _onItemSelected(context, index),
                  selectedIndex: context.watch<NavigationCubit>().state.index,
                  items: navigationItems,
                ),
              Expanded(
                child: FadeTransition(
                  opacity: const AlwaysStoppedAnimation(1),
                  child: child,
                ),
              )
            ],
          ),
          bottomNavigationBar: useNavigationRail
              ? null
              : BottomNavigation(
                  onItemSelected: (index) => _onItemSelected(context, index),
                  selectedIndex: context.watch<NavigationCubit>().state.index,
                  items: navigationItems,
                ),
        );
      },
    );
  }

  void _onItemSelected(BuildContext context, int index) {
    context.read<NavigationCubit>().changeIndex(index);
  }

  List<NavigationItem> _navigationItems(bool isAdmin) {
    return [
      const NavigationItem(
        label: "Home",
        icon: Iconsax.home,
        iconSelected: Iconsax.home,
        route: '/home',
      ),
      const NavigationItem(
        label: "Calendar",
        icon: Iconsax.calendar,
        iconSelected: Iconsax.calendar,
        route: '/calendar',
      ),
      const NavigationItem(
        label: "Schedule",
        icon: Iconsax.calendar_1,
        iconSelected: Iconsax.calendar_1,
        route: '/schedule',
      ),
      if (isAdmin)
        const NavigationItem(
          label: "Manage",
          icon: Iconsax.setting_3,
          iconSelected: Iconsax.setting_3,
          route: '/managment',
        ),
      const NavigationItem(
        label: "Account",
        icon: Iconsax.user,
        iconSelected: Iconsax.user,
        route: '/account',
      ),
    ];
  }
}
