import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';

class GTab extends StatelessWidget {
  const GTab({
    super.key,
    this.title,
    this.icon,
  });

  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: icon != null ? GSizes.tabHeighLg : GSizes.tabHeighSm,
      icon: icon != null ? Icon(icon) : null,
      text: title,
    );
  }
}
