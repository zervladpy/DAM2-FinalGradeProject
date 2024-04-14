import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constraints/colors.dart';
import '../../../../utils/constraints/sizes.dart';
import '../../../../utils/helper/helper.dart';

class GAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.onLeadingTap,
    this.bottom,
    this.showBackArrow = false,
  });

  final Widget? title;
  final bool showBackArrow;
  final List<Widget>? actions;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingTap;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    final bool isDark = GHelper.isDarkMode(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: GSizes.sm),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: context.pop,
                icon: Icon(
                  Iconsax.arrow_left,
                  color:
                      isDark ? GColor.darkBackground : GColor.lightBackground,
                ),
              )
            : leadingIcon != null
                ? IconButton(onPressed: onLeadingTap, icon: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(GSizes.appbarHeight);
}
