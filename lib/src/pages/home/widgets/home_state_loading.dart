import 'package:flutter/material.dart';

class HomeStateLoading extends StatelessWidget {
  const HomeStateLoading({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
