import 'package:flutter/material.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:iconsax/iconsax.dart';

class SelectProfile extends StatelessWidget {
  const SelectProfile({
    super.key,
    required this.label,
    this.selected = Profile.empty,
    this.items = const [],
    this.onSelect,
    this.validator,
  });

  final String label;
  final Profile selected;
  final List<Profile> items;
  final void Function(Profile)? onSelect;
  final String? Function(Profile?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
      ),
      items: items.map((profile) {
        return DropdownMenuItem(
          value: profile,
          child: Row(
            children: [
              const Icon(Iconsax.user),
              Text(profile.fullName),
            ],
          ),
        );
      }).toList(),
      onChanged: (v) => v == null ? null : onSelect?.call(v),
      validator: validator,
    );
  }
}
