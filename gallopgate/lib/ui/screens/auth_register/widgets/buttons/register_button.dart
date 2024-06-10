import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    this.onPressed,
    this.enabled = true,
    this.loading = false,
  });

  final void Function()? onPressed;
  final bool loading, enabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled && !loading ? () => onPressed?.call() : null,
      child: loading ? const LinearProgressIndicator() : const Text('Register'),
    );
  }
}
