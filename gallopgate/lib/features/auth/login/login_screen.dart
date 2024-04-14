import 'package:flutter/material.dart';
import 'package:gallopgate/utils/constraints/sizes.dart';

import 'widgets/page_login.dart';

/// Login Screen
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Page<Widget> get page => const MaterialPage(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    // TODO: Implement second page of verfying the account
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(GSizes.defaultSeparation),
          child: const LoginPage(),
        ),
      ),
    );
  }
}
