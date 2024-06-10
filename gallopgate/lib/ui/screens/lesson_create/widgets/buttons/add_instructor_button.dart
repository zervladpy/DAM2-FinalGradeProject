import 'package:flutter/material.dart';

class AddInstructorButton extends StatelessWidget {
  const AddInstructorButton({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Add Instructor'),
    );
  }
}
