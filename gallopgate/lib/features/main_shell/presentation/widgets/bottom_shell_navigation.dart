import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/features/main_shell/presentation/controller/navigation/navigation_cubit.dart';
import 'package:gallopgate/utils/helper/helper.dart';

import '../../../../utils/constraints/colors.dart';
import '../../domain/models/nav_destination.dart';

class BottomShellNavigation extends StatelessWidget {
  const BottomShellNavigation({
    super.key,
    required this.elements,
  });

  final List<NavDestination> elements;

  @override
  Widget build(BuildContext context) {
    final selectedColor = GHelper.isDarkMode(context)
        ? GColor.lightBackground
        : GColor.darkBackground;

    final unselectedColor = selectedColor.withOpacity(.4);

    final controller = context.read<NavigationCubit>();

    return BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (previous, current) => previous.currentIndex != current.currentIndex,
      builder: (context, state) {
        return NavigationBar(
          onDestinationSelected: controller.setIndex,
          selectedIndex: controller.state.currentIndex,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: elements
              .map((NavDestination e) {
            return NavigationDestination(
                icon: Icon(e.icon, color: unselectedColor),
                selectedIcon: Icon(e.icon, color: selectedColor),
                label: e.label
            );
          }).toList(),
        );
      },
    );
  }
}

