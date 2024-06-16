import 'package:flutter/material.dart';
import 'package:gallopgate/models/horse/horse.dart';
import 'package:iconsax/iconsax.dart';

class HorseDropdown extends StatelessWidget {
  const HorseDropdown({
    super.key,
    required this.items,
    this.onChanged,
    this.initialValue,
    this.label,
    this.isAdmin = false,
  });

  final List<Horse> items;
  final Function(Horse?)? onChanged;
  final Horse? initialValue;
  final String? label;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
      ),
      value: initialValue?.id,
      items: _mapToItems(items),
      onChanged: isAdmin
          ? (h) => onChanged?.call(items.firstWhere((e) => e.id == h))
          : null,
    );
  }

  List<DropdownMenuItem<String>> _mapToItems(
    List<Horse> items,
  ) {
    return items.map((h) {
      return DropdownMenuItem<String>(
        value: h.id,
        child: Row(
          children: [
            const Icon(Iconsax.activity),
            const SizedBox(width: 16.0),
            Text(h.fullName),
          ],
        ),
      );
    }).toList();
  }
}
