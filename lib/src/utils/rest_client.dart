import 'package:dio/dio.dart';

// Auxiliary class for handling API calls using Dio package.
class RestClient {
  final Dio _dio;

  RestClient({
    required Dio dio,
  }) : _dio = dio {
    _dio.options.baseUrl = 'https://api.openweathermap.org';
    _dio.options.connectTimeout = const Duration(milliseconds: 3000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 3000);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    _dio.options.queryParameters = {
      'appid': '3b5405b4b6bca0a95793ff071ef83e98',
    };
  }

  // Method to make a get request
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    final result = await _dio.get(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );

    return result;
  }
}
