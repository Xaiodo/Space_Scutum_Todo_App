import 'package:flutter/material.dart';

// Widget that represents the error state of the AddTask page.
class AddTaskStateError extends StatelessWidget {
  const AddTaskStateError({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: Text('Something went wrong!'),
      );
}
