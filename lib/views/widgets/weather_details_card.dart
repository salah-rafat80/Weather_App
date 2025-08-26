import 'package:flutter/material.dart';
import '/models/weather_model.dart';
import 'weather_info_item.dart';

class WeatherDetailsCard extends StatelessWidget {
  final Weather weather;
  final WeatherTheme theme;

  const WeatherDetailsCard({
    super.key,
    required this.weather,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.2),
            theme.primaryColor.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: theme.accentColor.withOpacity(0.3), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailsHeader(),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: WeatherInfoItem(
                  label: 'Humidity',
                  value: weather.humidityString,
                  icon: Icons.water_drop,
                  iconColor: theme.accentColor,
                  backgroundColor: theme.primaryColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: WeatherInfoItem(
                  label: 'Wind',
                  value: weather.windSpeedString,
                  icon: Icons.air,
                  iconColor: theme.accentColor.withOpacity(0.8),
                  backgroundColor: theme.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: WeatherInfoItem(
                  label: 'Pressure',
                  value: weather.pressureString,
                  icon: Icons.compress,
                  iconColor: theme.accentColor.withOpacity(0.6),
                  backgroundColor: theme.primaryColor,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: WeatherInfoItem(
                  label: 'Feels Like',
                  value: weather.feelsLikeString,
                  icon: Icons.thermostat,
                  iconColor: theme.accentColor.withOpacity(0.9),
                  backgroundColor: theme.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsHeader() {
    return Row(
      children: [
        Icon(Icons.info_outline, color: theme.accentColor, size: 24),
        const SizedBox(width: 8),
        const Text(
          'Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
