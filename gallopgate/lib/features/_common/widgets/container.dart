import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:gallopgate/utils/helper/helper.dart';

class GContainer extends StatelessWidget {
  const GContainer({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {

    final isDark = GHelper.isDarkMode(context);

    final containerLightColor = GColor.darkBackground.withOpacity(.1);
    final containerDarkColor = GColor.lightBackground.withOpacity(.05);

    return Container(
      constraints: const BoxConstraints(),
      decoration: BoxDecoration(
        color: isDark ? containerDarkColor : containerLightColor,
        borderRadius: BorderRadius.circular(GSizes.borderRadiusMd),
      ),
      child: Padding(
        padding: EdgeInsets.all(GSizes.defaultSeparation),
        child: child,
      ),
    );
  }
}
