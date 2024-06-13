import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    this.onSubmit,
    this.enabled = true,
    this.loading = false,
  });

  final void Function()? onSubmit;
  final bool enabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled && !loading ? () => onSubmit?.call() : null,
      child: loading ? const LinearProgressIndicator() : const Text('Login'),
    );
  }
}
