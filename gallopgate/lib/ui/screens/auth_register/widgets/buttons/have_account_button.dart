import 'package:flutter/material.dart';

class HaveAccountButton extends StatelessWidget {
  const HaveAccountButton({
    super.key,
    this.onPressed,
    this.enabeld = true,
  });

  final Function()? onPressed;
  final bool enabeld;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: enabeld ? () => onPressed?.call() : null,
      child: const Text('Have an account? Login'),
    );
  }
}
