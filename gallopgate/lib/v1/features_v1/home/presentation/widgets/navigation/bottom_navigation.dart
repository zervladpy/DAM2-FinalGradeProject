import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallopgate/v1/features_v1/home/presentation/widgets/navigation/navigation_item.dart';

import '../../controllers/navigation_cubit/navigation_cubit.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.items});

  final List<NavigationItem> items;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<NavigationCubit>();

    return BlocBuilder<NavigationCubit, NavigationState>(
      buildWhen: (prev, curr) => prev.index != curr.index,
      builder: (context, state) {
        return NavigationBar(
          onDestinationSelected: controller.onIndexChange,
          selectedIndex: state.index,
          destinations: items
              .map((e) => NavigationDestination(
                    icon: Icon(e.icon),
                    selectedIcon: Icon(e.iconSelected),
                    label: e.label,
                    tooltip: e.label,
                  ))
              .toList(),
        );
      },
    );
  }
}
