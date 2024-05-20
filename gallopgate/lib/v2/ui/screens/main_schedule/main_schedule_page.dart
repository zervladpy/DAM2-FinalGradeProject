import 'package:flutter/material.dart';

class MainSchedulePage extends StatelessWidget {
  const MainSchedulePage({super.key});

  static const page = MaterialPage(child: MainSchedulePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Schedule Page'),
      ),
      body: const Center(
        child: Text('Main Schedule Page'),
      ),
    );
  }
}
