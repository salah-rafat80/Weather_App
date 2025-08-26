import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/weather_controller.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/weather_app_bar.dart';
import '../widgets/weather_background.dart';
import '../widgets/weather_content_manager.dart';

class WeatherHomeView extends StatelessWidget {
  const WeatherHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherController>(
      builder: (context, controller, child) {
        final weatherTheme = controller.currentWeather?.theme;
        final backgroundGradient = weatherTheme?.backgroundGradient ?? [
          const Color(0xFF079FBD),
          const Color(0xFF234059),
        ];
        return Scaffold(
          backgroundColor: backgroundGradient[1],
          appBar: WeatherAppBar(weatherTheme: weatherTheme),
          body: WeatherBackground(
            weatherTheme: weatherTheme,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SearchBarWidget(weatherTheme: weatherTheme),
                    const SizedBox(height: 30),
                    WeatherContentManager(
                      controller: controller,
                      weatherTheme: weatherTheme,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
