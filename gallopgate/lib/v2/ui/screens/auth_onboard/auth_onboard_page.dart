import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthOnboardPage extends StatelessWidget {
  const AuthOnboardPage({super.key});

  static const page = MaterialPage(child: AuthOnboardPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.push('/auth/login');
              },
              child: const Text('Sign In'),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                context.push('/auth/register');
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
