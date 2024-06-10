import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';

class PreffrencesSliverAppbar extends StatelessWidget {
  const PreffrencesSliverAppbar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return GSliverAppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GAppbarTitle(title),
          GAppbarSubtitle(subtitle),
        ],
      ),
    );
  }
}
