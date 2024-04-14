import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';
import 'package:gallopgate/utils/helper/helper.dart';
import 'package:iconsax/iconsax.dart';

/// Open [Drawer] button: [IconButton]
class ButtonDrawer extends StatelessWidget {
  const ButtonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = GHelper.isDarkMode(context);

    return IconButton(
      onPressed: () => _openDrawer(context),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GSizes.defaultBorderSide),
        ),
        backgroundColor:
            isDarkMode ? GColor.darkBackground : GColor.lightBackground,
      ),
      icon: Icon(
        Iconsax.menu,
        color: isDarkMode ? GColor.darkTextColor : GColor.lightTextColor,
      ),
    );
  }

  Future<void> _openDrawer(BuildContext context) async {
    Scaffold.of(context).openDrawer();
  }
}
