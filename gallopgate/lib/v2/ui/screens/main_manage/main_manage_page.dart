import 'package:flutter/material.dart';

class MainManagePage extends StatelessWidget {
  const MainManagePage({super.key});

  static const page = MaterialPage(child: MainManagePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Manage Page'),
      ),
      body: const Center(
        child: Text('Main Manage Page'),
      ),
    );
  }
}
