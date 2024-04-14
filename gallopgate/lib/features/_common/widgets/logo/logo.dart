import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/colors.dart';
import 'package:gallopgate/utils/constraints/images.dart';
import 'package:gallopgate/utils/helper/helper.dart';

class GLogo extends StatelessWidget {
  const GLogo({
    super.key,
    this.height,
    this.width,
  });

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    bool isDark = GHelper.isDarkMode(context);
    String image = GImages.logoDark;

    return Image(
      image: AssetImage(image),
      width: width ?? 100,
      height: height ?? 100,
      color: isDark ? GColor.lightBackground : GColor.darkBackground,
    );
  }
}
