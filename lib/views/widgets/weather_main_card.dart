import 'package:flutter/material.dart';
import 'package:waether_app/models/weather_model.dart';
import 'weather_header_widget.dart';
import 'temperature_display_widget.dart';

class WeatherMainCard extends StatelessWidget {
  final Weather weather;
  final WeatherTheme theme;

  const WeatherMainCard({
    super.key,
    required this.weather,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.35),
            Colors.white.withOpacity(0.15),
            theme.primaryColor.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: theme.accentColor.withOpacity(0.4), width: 2),
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withOpacity(0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: theme.accentColor.withOpacity(0.1),
            blurRadius: 40,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        children: [
          WeatherHeaderWidget(weather: weather, theme: theme),
          TemperatureDisplayWidget(weather: weather, theme: theme),
        ],
      ),
    );
  }
}
