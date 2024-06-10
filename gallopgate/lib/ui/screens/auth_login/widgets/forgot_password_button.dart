import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
    this.onPressed,
    this.enabled = true,
  });

  final void Function()? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: enabled ? () => onPressed?.call() : null,
      child: const Text('Forgot Password?'),
    );
  }
}
