import 'package:flutter/material.dart';

// LoadingStateWidget for the AddTask page.
class AddTaskStateLoading extends StatelessWidget {
  const AddTaskStateLoading({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
