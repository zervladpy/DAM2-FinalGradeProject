import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    this.onPressed,
    this.enabled = true,
  });

  final void Function()? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: enabled ? () => onPressed?.call() : null,
      child: const Text('Don\'t have a account?'),
    );
  }
}
