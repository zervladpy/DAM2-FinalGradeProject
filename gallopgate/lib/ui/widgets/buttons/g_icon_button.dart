import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

class GIconButton extends StatelessWidget {
  const GIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.color = GColor.primaryLight,
  });

  final IconData icon;
  final void Function()? onPressed;
  final Color color;

  const factory GIconButton.filled({
    Key? key,
    required IconData icon,
    void Function()? onPressed,
    Color color,
  }) = _GIconButtonFilled;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}

class _GIconButtonFilled extends GIconButton {
  const _GIconButtonFilled({
    super.key,
    required super.icon,
    super.onPressed,
    super.color = GColor.primaryLight,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(color),
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
