import 'package:flutter/material.dart';
import '/models/weather_model.dart';

class WeatherLoadingWidget extends StatelessWidget {
  final WeatherTheme? weatherTheme;

  const WeatherLoadingWidget({super.key, this.weatherTheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherTheme?.accentColor.withOpacity(0.3) ?? Color(0xFFFFD700).withOpacity(0.3),
                    weatherTheme?.primaryColor.withOpacity(0.2) ?? Color(0xFF4682B4).withOpacity(0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: CircularProgressIndicator(
                  color: weatherTheme?.accentColor ?? Color(0xFFFFD700),
                  strokeWidth: 4,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Searching for weather data...',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Please wait...',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
