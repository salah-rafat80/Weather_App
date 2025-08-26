import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/weather_controller.dart';
import 'views/weather_home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherController(),
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Arial',
          useMaterial3: true,
        ),
        home: const WeatherHomeView(),
      ),
    );
  }
}
