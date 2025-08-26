import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherIconWidget extends StatelessWidget {
  final Weather weather;
  final WeatherTheme theme;

  const WeatherIconWidget({
    super.key,
    required this.weather,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            theme.accentColor.withOpacity(0.3),
            theme.primaryColor.withOpacity(0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: theme.accentColor.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(theme.icon, color: Colors.white, size: 50),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              weather.iconUrl,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(theme.icon, color: Colors.white, size: 50);
              },
            ),
          ),
        ],
      ),
    );
  }
}
