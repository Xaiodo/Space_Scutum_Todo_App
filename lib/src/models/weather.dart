import 'package:equatable/equatable.dart';

// Weather model to store weather data.
class Weather extends Equatable {
  const Weather({
    required this.cityName,
    required this.temperatureCelsius,
    required this.weatherDescription,
    required this.weatherIcon,
  });

  final String cityName;
  final double temperatureCelsius;
  final String weatherDescription;
  final String? weatherIcon;

  // Initial weather model state
  const Weather.initial()
      : cityName = '',
        temperatureCelsius = 0,
        weatherDescription = '',
        weatherIcon = null;

  // Method to convert json to weather model
  Weather.fromJson(Map<String, dynamic> json)
      : cityName = json['name'],
        temperatureCelsius = json['main']['temp'].toDouble(),
        weatherDescription = json['weather'][0]['description'],
        weatherIcon = json['weather'][0]['icon'];

  String get getImageUrl =>
      'https://openweathermap.org/img/wn/$weatherIcon.png';

  // Override props to compare weather models
  @override
  List<Object?> get props => [
        cityName,
        temperatureCelsius,
        weatherDescription,
        weatherIcon,
      ];
}
