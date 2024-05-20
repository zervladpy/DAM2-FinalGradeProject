import 'package:flutter/material.dart';

class MainSettingsPage extends StatelessWidget {
  const MainSettingsPage({super.key});

  static const page = MaterialPage(child: MainSettingsPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Settings Page'),
      ),
      body: const Center(
        child: Text('Main Settings Page'),
      ),
    );
  }
}
