import 'package:flutter/material.dart';

class RolePill extends StatelessWidget {
  const RolePill({
    super.key,
    required this.label,
    required this.color,
    this.icon,
  });

  final String label;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 16.0,
              color: Colors.white,
            ),
            const SizedBox(width: 4.0),
          ],
          Text(
            label,
            style: textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
