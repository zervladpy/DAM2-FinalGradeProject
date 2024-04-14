import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/colors.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';
import 'package:gallopgate/utils/helper/helper.dart';

class SemiTransparentText extends StatelessWidget {
  const SemiTransparentText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: _color(context).withOpacity(GSizes.opacityMedium),
          ),
    );
  }

  Color _color(BuildContext context) {
    return GHelper.isDarkMode(context)
        ? GColor.darkTextColor
        : GColor.lightTextColor;
  }
}
