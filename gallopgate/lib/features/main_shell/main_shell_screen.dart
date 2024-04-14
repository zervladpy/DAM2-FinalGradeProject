import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gallopgate/features/main_shell/domain/models/nav_destination.dart';
import 'package:gallopgate/features/main_shell/presentation/controller/navigation/navigation_cubit.dart';
import 'package:gallopgate/features/main_shell/presentation/widgets/bottom_shell_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constraints/routes.dart';

class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key, this.child, this.startIndex});

  static Page<MainShellScreen> page(Widget child, int startIndex) {
    return MaterialPage(
      child: MainShellScreen(
        startIndex: startIndex,
        child: child,
      ),
    );
  }

  final Widget? child;
  final int? startIndex;

  @override
  Widget build(BuildContext context) {
    final List<NavDestination> destinations = [
      NavDestination(
        Iconsax.home,
        Iconsax.home,
        AppLocalizations.of(context)?.dashboard ?? "D",
        GRoutes.home,
      ),
      NavDestination(
        Iconsax.watch,
        Iconsax.watch,
        AppLocalizations.of(context)?.schedule ?? "S",
        GRoutes.schedule,
      ),
      NavDestination(
        Iconsax.message,
        Iconsax.message,
        AppLocalizations.of(context)?.chat ?? "C",
        GRoutes.chat,
      ),
      NavDestination(
        Iconsax.user,
        Iconsax.user,
        AppLocalizations.of(context)?.account ?? "A",
        GRoutes.account,
      ),
    ];

    return BlocProvider<NavigationCubit>(
      create: (BuildContext _) => NavigationCubit(
        startIndex,
        navigateTo: (route) => context.go(route),
        routes: destinations.map((e) => e.route).toList(),
      ),
      child: Scaffold(
        body: child,
        bottomNavigationBar: BottomShellNavigation(elements: destinations),
      ),
    );
  }
}
