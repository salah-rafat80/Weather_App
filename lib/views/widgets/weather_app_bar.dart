import 'package:flutter/material.dart';
import '/models/weather_model.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  final WeatherTheme? weatherTheme;

  const WeatherAppBar({super.key, this.weatherTheme});

  @override
  Widget build(BuildContext context) {
    final backgroundGradient = weatherTheme?.backgroundGradient ?? [
      Color(0xFF87CEEB),
      Color(0xFF4682B4),
    ];

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  weatherTheme?.accentColor.withOpacity(0.3) ?? Colors.white.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              weatherTheme?.icon ?? Icons.wb_sunny,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Weather App',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 3,
                  color: Colors.black26,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: backgroundGradient,
            stops: const [0.0, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: backgroundGradient[1].withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
