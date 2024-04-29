import 'package:flutter/material.dart';

class GText extends StatelessWidget {
  const GText({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
