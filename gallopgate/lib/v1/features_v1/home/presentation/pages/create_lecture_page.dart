import 'package:flutter/material.dart';
import 'package:gallopgate/v1/config/extension/double.dart';

class CreateLecturePage extends StatelessWidget {
  const CreateLecturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Lecture"),
      ),
      body: const _CreateLecturePage(),
    );
  }
}

class _CreateLecturePage extends StatelessWidget {
  const _CreateLecturePage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.0.paddingAll,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Description",
              ),
            ),
            const SizedBox(height: 16.0),
            const ElevatedButton(
              onPressed: null,
              child: Text("Create"),
            )
          ],
        ),
      ),
    );
  }
}
