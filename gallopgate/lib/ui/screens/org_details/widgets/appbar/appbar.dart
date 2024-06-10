import 'package:flutter/material.dart';
import 'package:gallopgate/models/organization/organization.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';

class OrgDetailsAppBar extends StatelessWidget {
  const OrgDetailsAppBar({
    super.key,
    this.organization = Organization.empty,
  });

  final Organization organization;

  @override
  Widget build(BuildContext context) {
    return GSliverAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GAppbarTitle('Organization Details'),
          GAppbarSubtitle(organization.name),
        ],
      ),
    );
  }
}
