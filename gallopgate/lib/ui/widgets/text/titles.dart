import 'package:flutter/material.dart';
import 'package:gallopgate/config/extensions/context.dart';

class GAppbarTitle extends StatelessWidget {
  const GAppbarTitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme;

    return Text(
      text,
      style: textStyle.bodyLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class GAppbarSubtitle extends StatelessWidget {
  const GAppbarSubtitle(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme;

    return Text(
      text,
      style: textStyle.bodySmall,
      overflow: TextOverflow.ellipsis,
    );
  }
}
