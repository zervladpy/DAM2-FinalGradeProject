import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';

class DefaultSeparator extends StatelessWidget {
  const DefaultSeparator._(this.vertical);

  final bool vertical;

  factory DefaultSeparator.vertical() => const DefaultSeparator._(true);
  factory DefaultSeparator.horizontal() => const DefaultSeparator._(false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: !vertical ? GSizes.defaultSeparation : null,
      height: vertical ? GSizes.defaultSeparation : null,
    );
  }
}
