import 'package:flutter/material.dart';
class MyAppBar extends StatelessWidget {
   MyAppBar({super.key});
  final backgroundGradient = [
    Color(0xFF87CEEB),
    Color(0xFF4682B4),
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color(0xFF87CEEB),
                Color(0xFF64B5F6)
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(
            Icons.wb_sunny,
            color: Colors.orange.shade200,
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
    );
  }
}
