import 'package:flutter/material.dart';
import 'package:space_scutum_todo_app/src/models/weather.dart';

class WeatherAppBarLoaded extends StatelessWidget {
  const WeatherAppBarLoaded({
    super.key,
    required this.imageUrl,
    required this.weather,
  });

  final String imageUrl;
  final Weather weather;

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: Colors.blueGrey[200],
        leading: Image.network(
          imageUrl,
          fit: BoxFit.fill,
          loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress == null
                  ? child
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
          errorBuilder: (context, error, stackTrace) => const Center(
            child: Icon(Icons.error),
          ),
        ),
        title: ListTile(
          title: Text(weather.cityName),
          subtitle: Text(
            '${weather.temperatureCelsius}°C ${weather.weatherDescription}',
          ),
        ),
      );
}
