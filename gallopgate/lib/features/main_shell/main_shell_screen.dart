import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/main_shell/domain/models/nav_destination.dart';
import 'package:gallopgate/features/main_shell/presentation/controller/navigation/navigation_cubit.dart';
import 'package:gallopgate/features/main_shell/presentation/pages/home/page_home_screen.dart';
import 'package:gallopgate/features/main_shell/presentation/widgets/bottom_shell_navigation.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:gallopgate/utils/helper/helper.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key, this.child, this.startIndex});

  final Widget? child;
  final int? startIndex;

  @override
  Widget build(BuildContext context) {

    final List<NavDestination> destinations = [
      NavDestination(
        Iconsax.home,
        Iconsax.home,
        AppLocalizations.of(context)?.dashboard ?? "D",
      ),
      NavDestination(
          Iconsax.watch,
          Iconsax.watch,
          AppLocalizations.of(context)?.schedule ?? "S",
      ),
      NavDestination(
          Iconsax.message,
          Iconsax.message,
        AppLocalizations.of(context)?.chat ?? "C",
      ),
      NavDestination(
          Iconsax.user,
          Iconsax.user,
        AppLocalizations.of(context)?.account ?? "A",
      ),
    ];

    return BlocProvider<NavigationCubit>(
      create: (BuildContext _) => NavigationCubit(startIndex),
      child: Scaffold(
        body: const PageHomeScreen(),
        bottomNavigationBar: BottomShellNavigation(elements: destinations),
      ),
    );
  }
}
