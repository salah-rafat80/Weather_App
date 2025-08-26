import 'package:flutter/material.dart';
import 'package:waether_app/models/weather_model.dart';
import 'weather_icon_widget.dart';

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
      padding: const EdgeInsets.all(28),
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
          _buildCityAndIcon(),
          const SizedBox(height: 25),
          _buildTemperatureDisplay(),
        ],
      ),
    );
  }

  Widget _buildCityAndIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weather.cityName,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
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
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        WeatherIconWidget(weather: weather, theme: theme),
      ],
    );
  }

  Widget _buildTemperatureDisplay() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
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
          Container(
            margin: const EdgeInsets.only(top: 8),
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
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
