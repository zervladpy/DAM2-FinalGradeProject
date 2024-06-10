import 'package:flutter/material.dart';

class ErrorNotFoundPage extends StatelessWidget {
  const ErrorNotFoundPage({super.key});

  static const page = MaterialPage(child: ErrorNotFoundPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('404: Not Found'),
    );
  }
}
