import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:gallopgate/utils/helper/helper.dart';

class ContainerShadowed extends StatelessWidget {
  const ContainerShadowed({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = GHelper.isDarkMode(context);

    Color bgColor = isDarkMode ? GColor.darkBackground : GColor.lightBackground;
    Color shadowColor =
        (isDarkMode ? GColor.lightBackground : GColor.darkBackground)
            .withOpacity(.1);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 10,
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(GSizes.separationSm),
        child: child,
      ),
    );
  }
}
