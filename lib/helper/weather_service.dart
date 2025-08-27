import 'dart:async';

import 'package:dio/dio.dart';
import '../models/weather_model.dart';

class WeatherService {
  static const String _baseUrl = 'https://api.weatherapi.com/v1';
  static const String _apiKey = 'f972848eccb249ab878212732252408';

  late final Dio _dio;

  WeatherService() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    )
    );

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (o) => print('DIO: $o'),
    ));
  }

  Future<Weather> getWeatherByCity(String cityName) async {
    try {
      print('Making API call for city: $cityName');

      final response = await _dio.get(
        '/current.json',
        queryParameters: {
          'key': _apiKey,
          'q': cityName,
          'aqi': 'no',
        },
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        if (data.containsKey('location') && data.containsKey('current')) {
          return Weather.fromWeatherApiJson(data);
        } else {
          throw Exception('Invalid data received from server');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      print('Dio Error: ${dioError.type} - ${dioError.message}');

      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw Exception('Connection timeout - Please try again');

        case DioExceptionType.badResponse:
          final statusCode = dioError.response?.statusCode;
          if (statusCode == 400) {
            final errorData = dioError.response?.data;
            final errorMessage = errorData?['error']?['message'] ?? 'City not found';
            throw Exception('City not found: $errorMessage');
          } else if (statusCode == 401) {
            throw Exception('API key issue - Check settings');
          } else if (statusCode == 403) {
            throw Exception('API quota exceeded');
          } else {
            throw Exception('Server error: $statusCode');
          }

        case DioExceptionType.connectionError:
          throw Exception('Cannot connect to server - Check internet connection');

        case DioExceptionType.cancel:
          throw Exception('Request cancelled');

        default:
          throw Exception('Network error: ${dioError.message}');
      }
    } catch (e) {
      print('Error in getWeatherByCity: $e');
      if (e.toString().contains('Exception:')) {
        rethrow;
      } else {
        throw Exception('Unexpected error: ${e.toString()}');
      }
    }
  }

  Future<Weather> getWeatherByCoordinates(double lat, double lon) async {
    try {
      final response = await _dio.get(
        '/current.json',
        queryParameters: {
          'key': _apiKey,
          'q': '$lat,$lon',
          'aqi': 'no',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return Weather.fromWeatherApiJson(response.data);
      } else {
        throw Exception('Failed to get weather data');
      }
    } on DioException catch (dioError) {
      throw Exception('Connection error: ${dioError.message}');
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
