import 'package:flutter/material.dart';

class WeatherAppBarLoading extends StatelessWidget {
  const WeatherAppBarLoading({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
