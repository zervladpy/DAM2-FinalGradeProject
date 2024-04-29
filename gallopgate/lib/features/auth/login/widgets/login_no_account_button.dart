import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/routes.dart';
import 'package:go_router/go_router.dart';

class NoAccountButton extends StatelessWidget {
  const NoAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.push(GRoutes.signup),
      child: const Text("Don't have account?"),
    );
  }
}
