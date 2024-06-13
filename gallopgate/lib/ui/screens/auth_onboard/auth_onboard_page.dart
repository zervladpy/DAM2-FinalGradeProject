import 'package:flutter/material.dart';
import 'package:gallopgate/config/extensions/context.dart';
import 'package:gallopgate/ui/widgets/image/logo_image.dart';
import 'package:go_router/go_router.dart';

class AuthOnboardPage extends StatelessWidget {
  const AuthOnboardPage({super.key});

  static const page = MaterialPage(child: AuthOnboardPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LogoImage(
                    height: 200,
                    width: 200,
                    scale: 5,
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Text(
                        "GallopGate",
                        style: context.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Manage and track your horses and lessons with ease.",
                    style: context.textTheme.bodyMedium,
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
