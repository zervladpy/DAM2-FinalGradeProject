import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';

class LargeSeparator extends StatelessWidget {
  const LargeSeparator._(this.vertical);

  final bool vertical;

  factory LargeSeparator.vertical() => const LargeSeparator._(true);
  factory LargeSeparator.horizontal() => const LargeSeparator._(false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: !vertical ? GSizes.separationLg : null,
      height: vertical ? GSizes.separationLg : null,
    );
  }
}
