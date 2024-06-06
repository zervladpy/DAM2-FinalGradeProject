import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

abstract class GIconButton extends StatelessWidget {
  const GIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  final IconData icon;
  final void Function()? onPressed;

  const factory GIconButton.filled({
    Key? key,
    required IconData icon,
    void Function()? onPressed,
  }) = _GIconButtonFilled;
}

class _GIconButtonFilled extends GIconButton {
  const _GIconButtonFilled({super.key, required super.icon, super.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(GColor.primaryLight),
      ),
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: GColor.surfaceLight,
      ),
    );
  }
}
