import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class WeatherBackground extends StatelessWidget {
  final WeatherTheme? weatherTheme;
  final Widget child;

  const WeatherBackground({
    super.key,
    this.weatherTheme,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundGradient = weatherTheme?.backgroundGradient ?? [
      const Color(0xFF87CEEB),
      const Color(0xFF4682B4),
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: backgroundGradient,
          stops: const [0.0, 1.0],
        ),
      ),
      child: child,
    );
  }
}
