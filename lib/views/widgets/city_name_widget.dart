import 'package:flutter/material.dart';
import 'package:waether_app/models/weather_model.dart';

class CityNameWidget extends StatelessWidget {
  final Weather weather;
  final WeatherTheme theme;

  const CityNameWidget({
    super.key,
    required this.weather,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weather.cityName,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 4,
                color: Colors.black26,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: theme.accentColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            weather.description,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
