import 'package:flutter/material.dart';

class WeatherAppBarInitial extends StatelessWidget {
  const WeatherAppBarInitial({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud),
            SizedBox(width: 8),
            Text('Weather'),
          ],
        ),
      );
}
