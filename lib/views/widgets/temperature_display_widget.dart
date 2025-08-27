import 'package:flutter/material.dart';
import 'package:waether_app/models/weather_model.dart';

class TemperatureDisplayWidget extends StatelessWidget {
  final Weather weather;
  final WeatherTheme theme;

  const TemperatureDisplayWidget({
    super.key,
    required this.weather,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            weather.temperatureString,
            style: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.w200,
              color: Colors.white,
              height: 1,
              shadows: [
                Shadow(
                  offset: const Offset(3, 3),
                  blurRadius: 6,
                  color: theme.primaryColor.withOpacity(0.5),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          FeelsLikeWidget(weather: weather, theme: theme),
        ],
      ),
    );
  }
}

class FeelsLikeWidget extends StatelessWidget {
  final Weather weather;
  final WeatherTheme theme;

  const FeelsLikeWidget({
    super.key,
    required this.weather,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.primaryColor.withOpacity(0.6),
            theme.accentColor.withOpacity(0.4),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Feels like ${weather.feelsLikeString}',
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
