import 'package:flutter/material.dart';
import '/models/weather_model.dart';

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
      width: 80,
      height: 80,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(image: NetworkImage(weather.iconUrl),
            fit: BoxFit.contain,)
        ),
      ),
    );
  }
}
