import 'package:flutter/material.dart';
import 'package:gallopgate/config/theme/utils/colors.dart';

class Selection extends StatelessWidget {
  const Selection({
    super.key,
    this.spacing = 16.0,
    required this.items,
    required this.selected,
    this.onSelect,
  });

  final double spacing;
  final List<String> items;
  final List<String> selected;
  final void Function(String)? onSelect;

  @override
  Widget build(BuildContext context) {
    assert(items.isNotEmpty, 'Selection items cannot be empty');

    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: spacing,
      runSpacing: spacing,
      children: items
          .map((e) => SelectionItem(
                label: e,
                onTap: onSelect,
                selected: selected.contains(e),
              ))
          .toList(),
    );
  }
}

class SelectionItem extends StatelessWidget {
  const SelectionItem({
    super.key,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  final String label;
  final bool selected;
  final void Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(label),
      child: AnimatedContainer(
        duration: Durations.medium1,
        decoration: BoxDecoration(
          color: selected ? GColor.primaryLight : Colors.transparent,
          border: selected
              ? null
              : Border.all(color: GColor.primaryLight, width: 0.5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? GColor.surfaceLight : GColor.primaryLight,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
