import 'package:flutter/material.dart';
import 'package:waether_app/models/weather_model.dart';
import 'city_name_widget.dart';
import 'weather_icon_widget.dart';

class WeatherHeaderWidget extends StatelessWidget {
  final Weather weather;
  final WeatherTheme theme;

  const WeatherHeaderWidget({
    super.key,
    required this.weather,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CityNameWidget(weather: weather, theme: theme),
        WeatherIconWidget(weather: weather, theme: theme),
      ],
    );
  }
}
