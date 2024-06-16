
import 'package:flutter/material.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:iconsax/iconsax.dart';

class ProfileDropdown extends StatelessWidget {
  const ProfileDropdown({
    super.key,
    required this.items,
    this.onChanged,
    this.initialValue,
    this.label,
    this.isAdmin = false,
  });

  final Profile? initialValue;
  final String? label;
  final bool isAdmin;
  final List<Profile> items;
  final Function(Profile?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
      ),
      value: initialValue?.id,
      items: _mapToItem(items),
      onChanged: isAdmin
          ? (p) => {
                onChanged?.call(items.firstWhere((element) => element.id == p)),
              }
          : null,
    );
  }

  List<DropdownMenuItem<String>> _mapToItem(
    List<Profile> items,
  ) {
    return items.map((p) {
      return DropdownMenuItem(
        value: p.id,
        child: Row(
          children: [
            const Icon(Iconsax.user),
            const SizedBox(width: 16.0),
            Text(p.fullName),
          ],
        ),
      );
    }).toList();
  }
}
