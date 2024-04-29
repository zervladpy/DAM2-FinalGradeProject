import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:gallopgate/utils/helper/helper.dart';

class GCard extends StatelessWidget {
  const GCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = GHelper.isDarkMode(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GSizes.borderRadiusSm),
      ),
      shadowColor: isDarkMode ? GColor.lightBackground : GColor.darkBackground,
      color: isDarkMode ? GColor.darkBackground : GColor.lightBackground,
      child: child,
    );
  }
}
