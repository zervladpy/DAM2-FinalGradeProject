import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/colors.dart';
import 'package:gallopgate/utils/constraints/fonts.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';
import 'package:gallopgate/utils/helper/helper.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: GSizes.lg,
        fontFamily: GFonts.montserrat,
        fontWeight: GSizes.fontBold,
        color: _color(context),
      ),
    );
  }

  Color _color(BuildContext context) {
    return GHelper.isDarkMode(context)
        ? GColor.darkTextColor
        : GColor.lightTextColor;
  }
}
