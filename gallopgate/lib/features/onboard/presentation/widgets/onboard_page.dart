import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:gallopgate/utils/device/device_utils.dart';
import 'package:gallopgate/utils/helper/helper.dart';

/// Page definition for [OnBoardScreen]
class PageOnBoard extends StatelessWidget {
  const PageOnBoard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    final bool isDark = GHeleper.isDarkMode(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
            image: AssetImage(image),
            width: GDeviceUtils.getDeviceHeight(context) * 0.3,
            height: GDeviceUtils.getDeviceHeight(context) * 0.4,
            color: isDark ? GColor.lightBackground : GColor.darkBackground,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}