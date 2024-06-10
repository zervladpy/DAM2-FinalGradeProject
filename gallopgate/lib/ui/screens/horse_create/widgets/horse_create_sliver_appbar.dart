import 'package:flutter/material.dart';
import 'package:gallopgate/ui/widgets/appbar/sliver_appbar.dart';
import 'package:gallopgate/ui/widgets/text/titles.dart';

class HorseCreateSliverAppbar extends StatelessWidget {
  const HorseCreateSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const GSliverAppBar(
      title: GAppbarTitle('Create horse'),
    );
  }
}
