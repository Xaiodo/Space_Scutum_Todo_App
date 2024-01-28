// Weather service  to get weather data from openweathermap api.
import 'package:space_scutum_todo_app/src/models/weather.dart';

import '../utils/rest_client.dart';

class WeatherService {
  const WeatherService({
    required RestClient restClient,
  }) : _restClient = restClient;

  // The rest client instance to make http requests with configured dio instance
  final RestClient _restClient;

  // Get the current weather for a specific city
  Future<Weather> getCurrentWeather(
    String cityName, {
    String units = 'metric',
  }) async {
    final response = await _restClient.get(
      '/data/2.5/weather?',
      queryParameters: {
        'q': cityName,
        'units': units,
      },
    );

    return Weather.fromJson(response.data);
  }
}
