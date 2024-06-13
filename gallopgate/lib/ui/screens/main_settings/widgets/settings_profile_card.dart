import 'package:flutter/material.dart';
import 'package:gallopgate/models/profile/profile.dart';
import 'package:iconsax/iconsax.dart';

class SettingsProfileCard extends StatelessWidget {
  const SettingsProfileCard({
    super.key,
    required this.profile,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final showAvatar = profile.avatarUrl.isNotEmpty;

    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: showAvatar ? NetworkImage(profile.avatarUrl) : null,
          child: !showAvatar ? const Icon(Iconsax.user) : null,
        ),
        title: Text('${profile.firstName} ${profile.lastName}'),
        subtitle: Text(profile.email),
        // trailing: Chip(label: Text(profile.roles)),
      ),
    );
  }
}
