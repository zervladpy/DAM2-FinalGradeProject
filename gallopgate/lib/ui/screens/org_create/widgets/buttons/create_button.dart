import 'package:flutter/material.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({
    super.key,
    this.onPressed,
    this.enabled = true,
    this.loading = false,
  });

  final Function()? onPressed;
  final bool enabled, loading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? () => onPressed?.call() : null,
      child: const Text('Create'),
    );
  }
}
