import 'package:flutter/material.dart';

class GText extends StatelessWidget {
  const GText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
