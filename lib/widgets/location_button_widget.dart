import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class LocationButtonWidget extends StatelessWidget {
  final WeatherTheme? weatherTheme;
  final Color accentColor;
  final VoidCallback onPressed;

  const LocationButtonWidget({
    super.key,
    this.weatherTheme,
    required this.accentColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: accentColor.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(Icons.gps_fixed, color: Colors.white, size: 24),
          label: Text(
            'Get Current Location Weather',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: accentColor.withOpacity(0.9),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(vertical: 15),
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
