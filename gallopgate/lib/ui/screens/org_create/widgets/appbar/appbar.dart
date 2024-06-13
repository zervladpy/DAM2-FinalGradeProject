import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';

class OrgCreateAppbar extends StatelessWidget {
  const OrgCreateAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const GSliverAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GAppbarTitle('Create a new Organization'),
          GAppbarSubtitle('GallopGate'),
        ],
      ),
    );
  }
}
