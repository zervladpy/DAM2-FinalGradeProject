import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/_constraints_library.dart';

class ElevatedButtonIcon extends StatelessWidget {
  const ElevatedButtonIcon({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        maximumSize: Size(
          GSizes.defaultHeight,
          GSizes.defaultHeight,
        ),
        minimumSize: Size(
          GSizes.defaultHeight,
          GSizes.defaultHeight,
        ),
      ),
      onPressed: onPressed,
      child: Icon(
        icon,
        size: GSizes.iconLg,
      ),
    );
  }
}
