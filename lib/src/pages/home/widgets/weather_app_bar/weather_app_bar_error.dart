import 'package:flutter/material.dart';

class WeatherAppBarError extends StatelessWidget {
  const WeatherAppBarError({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: ListTile(
          leading: Icon(Icons.error),
          title: Text('Something went wrong'),
        ),
      );
}
