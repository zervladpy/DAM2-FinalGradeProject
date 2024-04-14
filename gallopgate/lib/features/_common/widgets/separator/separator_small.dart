import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';

class SmallSeparator extends StatelessWidget {
  const SmallSeparator._(this.vertical);

  final bool vertical;

  factory SmallSeparator.vertical() => const SmallSeparator._(true);
  factory SmallSeparator.horizontal() => const SmallSeparator._(false);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: !vertical ? GSizes.separationSm : null,
      height: vertical ? GSizes.separationSm : null,
    );
  }
}
