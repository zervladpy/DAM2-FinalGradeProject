import 'package:flutter/material.dart';

class MainCalendarPage extends StatelessWidget {
  const MainCalendarPage({super.key});

  static const page = MaterialPage(child: MainCalendarPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Calendar Page'),
      ),
      body: const Center(
        child: Text('Main Calendar Page'),
      ),
    );
  }
}
