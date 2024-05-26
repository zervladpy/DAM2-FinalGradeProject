import 'package:flutter/material.dart';
import 'package:gallopgate/config/extensions/context.dart';

class SelectionItem<T> extends StatelessWidget {
  const SelectionItem({
    super.key,
    required this.label,
    required this.item,
    this.icon,
    this.onSelect,
    this.isSelected = false,
  });

  final String label;
  final IconData? icon;
  final T item;
  final Function(T)? onSelect;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;

    final bgColor = isSelected ? colorScheme.primary : colorScheme.surface;
    final onBgColor =
        isSelected ? colorScheme.onPrimary : colorScheme.onSurface;

    return AnimatedContainer(
      duration: Durations.short4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: bgColor,
      ),
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onSelect != null ? () => onSelect?.call(item) : null,
        child: Row(
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(icon, color: onBgColor),
              ),
            Text(
              label,
              style: textTheme.bodyLarge?.copyWith(color: onBgColor),
            ),
          ],
        ),
      ),
    );
  }
}
