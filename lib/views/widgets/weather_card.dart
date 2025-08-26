import 'package:flutter/material.dart';
import '/models/weather_model.dart';
import 'weather_main_card.dart';
import 'weather_details_card.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final theme = weather.theme;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          WeatherMainCard(weather: weather, theme: theme),
          const SizedBox(height: 25),
          WeatherDetailsCard(weather: weather, theme: theme),
        ],
      ),
    );
  }
}
