import 'package:flutter/material.dart';

enum WeatherCondition {
  clear,
  partlyCloudy,
  cloudy,
  overcast,
  mist,
  patchy,
  rain,
  drizzle,
  heavyRain,
  snow,
  blizzard,
  fog,
  thunderstorm,
}

class WeatherTheme {
  final List<Color> backgroundGradient;
  final Color primaryColor;
  final Color accentColor;
  final IconData icon;
  final String description;

  WeatherTheme({
    required this.backgroundGradient,
    required this.primaryColor,
    required this.accentColor,
    required this.icon,
    required this.description,
  });

  static WeatherTheme getThemeForCondition(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.clear:
        return WeatherTheme(
          backgroundGradient: [Color(0xFF87CEEB), Color(0xFF4682B4)],
          primaryColor: Color(0xFF4682B4),
          accentColor: Color(0xFF64B5F6),
          icon: Icons.wb_sunny,
          description: "Clear & Sunny",
        );
      case WeatherCondition.partlyCloudy:
        return WeatherTheme(
          backgroundGradient: [Color(0xFF87CEFA), Color(0xFF6495ED)],
          primaryColor: Color(0xFF6495ED),
          accentColor: Color(0xFF81C784),
          icon: Icons.wb_sunny_outlined,
          description: "Partly Cloudy",
        );
      case WeatherCondition.cloudy:
      case WeatherCondition.overcast:
        return WeatherTheme(
          backgroundGradient: [Color(0xFF708090), Color(0xFF2F4F4F)],
          primaryColor: Color(0xFF708090),
          accentColor: Color(0xFF90CAF9),
          icon: Icons.cloud,
          description: "Cloudy",
        );
      case WeatherCondition.rain:
      case WeatherCondition.drizzle:
        return WeatherTheme(
          backgroundGradient: [Color(0xFF4169E1), Color(0xFF191970)],
          primaryColor: Color(0xFF4169E1),
          accentColor: Color(0xFF4FC3F7),
          icon: Icons.grain,
          description: "Rainy",
        );
      case WeatherCondition.heavyRain:
      case WeatherCondition.thunderstorm:
        return WeatherTheme(
          backgroundGradient: [Color(0xFF2F4F4F), Color(0xFF1C1C1C)],
          primaryColor: Color(0xFF2F4F4F),
          accentColor: Color(0xFF7986CB),
          icon: Icons.thunderstorm,
          description: "Stormy",
        );
      case WeatherCondition.mist:
      case WeatherCondition.fog:
        return WeatherTheme(
          backgroundGradient: [Color(0xFFD3D3D3), Color(0xFFA9A9A9)],
          primaryColor: Color(0xFFA9A9A9),
          accentColor: Color(0xFF9FA8DA),
          icon: Icons.foggy,
          description: "Misty",
        );
      case WeatherCondition.snow:
      case WeatherCondition.blizzard:
        return WeatherTheme(
          backgroundGradient: [Color(0xFFF0F8FF), Color(0xFFB0E0E6)],
          primaryColor: Color(0xFFB0E0E6),
          accentColor: Color(0xFF81D4FA),
          icon: Icons.ac_unit,
          description: "Snowy",
        );
      default:
        return WeatherTheme(
          backgroundGradient: [Color(0xFF87CEEB), Color(0xFF4682B4)],
          primaryColor: Color(0xFF4682B4),
          accentColor: Color(0xFF64B5F6),
          icon: Icons.wb_sunny,
          description: "Unknown",
        );
    }
  }
}

class Weather {
  final String cityName;
  final double temperature;
  final String description;
  final String icon;
  final double feelsLike;
  final int humidity;
  final double windSpeed;
  final int pressure;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.description,
    required this.icon,
    required this.feelsLike,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      feelsLike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      pressure: json['main']['pressure'],
    );
  }

  factory Weather.fromWeatherApiJson(Map<String, dynamic> json) {
    try {
      return Weather(
        cityName: json['location']?['name']?.toString() ?? 'Unknown',
        temperature: _parseDouble(json['current']?['temp_c']),
        description: json['current']?['condition']?['text']?.toString() ?? 'Not available',
        icon: json['current']?['condition']?['icon']?.toString() ?? '',
        feelsLike: _parseDouble(json['current']?['feelslike_c']),
        humidity: _parseInt(json['current']?['humidity']),
        windSpeed: _parseDouble(json['current']?['wind_kph']) / 3.6,
        pressure: _parseInt(json['current']?['pressure_mb']),
      );
    } catch (e) {
      print('Error parsing weather data: $e');
      print('JSON data: $json');
      rethrow;
    }
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }

  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }

  String get temperatureString => '${temperature.round()}°C';
  String get feelsLikeString => '${feelsLike.round()}°C';
  String get windSpeedString => '${windSpeed.toStringAsFixed(1)} m/s';
  String get humidityString => '$humidity%';
  String get pressureString => '$pressure hPa';

  String get iconUrl => 'https:${icon}';

  WeatherCondition get condition {
    final desc = description.toLowerCase();
    if (desc.contains('clear') || desc.contains('sunny')) {
      return WeatherCondition.clear;
    } else if (desc.contains('partly cloudy') || desc.contains('partly')) {
      return WeatherCondition.partlyCloudy;
    } else if (desc.contains('cloudy') || desc.contains('overcast')) {
      return WeatherCondition.cloudy;
    } else if (desc.contains('mist') || desc.contains('haze')) {
      return WeatherCondition.mist;
    } else if (desc.contains('fog')) {
      return WeatherCondition.fog;
    } else if (desc.contains('drizzle') || desc.contains('light rain')) {
      return WeatherCondition.drizzle;
    } else if (desc.contains('heavy rain') || desc.contains('torrential')) {
      return WeatherCondition.heavyRain;
    } else if (desc.contains('rain') || desc.contains('shower')) {
      return WeatherCondition.rain;
    } else if (desc.contains('thunder') || desc.contains('storm')) {
      return WeatherCondition.thunderstorm;
    } else if (desc.contains('snow') || desc.contains('blizzard')) {
      return WeatherCondition.snow;
    }
    return WeatherCondition.clear;
  }

  WeatherTheme get theme => WeatherTheme.getThemeForCondition(condition);
}
