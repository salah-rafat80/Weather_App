import 'package:flutter/material.dart';
import '../controllers/weather_controller.dart';
import '../models/weather_model.dart';
import 'weather_card.dart';
import 'weather_loading_widget.dart';
import 'weather_error_widget.dart';
import 'weather_empty_widget.dart';

class WeatherContentManager extends StatelessWidget {
  final WeatherController controller;
  final WeatherTheme? weatherTheme;

  const WeatherContentManager({
    super.key,
    required this.controller,
    this.weatherTheme,
  });

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading) {
      return WeatherLoadingWidget(weatherTheme: weatherTheme);
    }

    if (controller.errorMessage != null) {
      return WeatherErrorWidget(
        errorMessage: controller.errorMessage!,
        weatherTheme: weatherTheme,
        onRetry: controller.clearError,
      );
    }

    if (controller.currentWeather == null) {
      return WeatherEmptyWidget(weatherTheme: weatherTheme);
    }

    return WeatherCard(weather: controller.currentWeather!);
  }
}
