import 'package:flutter/material.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:iconsax/iconsax.dart';

class SelectHorse extends StatelessWidget {
  const SelectHorse({
    super.key,
    this.selected = Horse.empty,
    required this.label,
    this.items = const [],
    this.onSelect,
    this.validator,
  });

  final String label;
  final List<Horse> items;
  final Horse selected;
  final void Function(Horse)? onSelect;
  final String? Function(Horse?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
      ),
      items: items.map((horse) {
        return DropdownMenuItem(
          value: horse,
          child: Row(
            children: [
              const Icon(Iconsax.activity),
              Text(horse.alias ?? horse.fullName),
            ],
          ),
        );
      }).toList(),
      onChanged: (v) => v == null ? null : onSelect?.call(v),
      validator: validator,
    );
  }
}
