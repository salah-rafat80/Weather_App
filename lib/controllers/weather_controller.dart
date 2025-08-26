import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';
import '../services/location_service.dart';

class WeatherController extends ChangeNotifier {
  late final WeatherService _weatherService;
  late final LocationService _locationService;

  Weather? _currentWeather;
  bool _isLoading = false;
  String? _errorMessage;
  WeatherController() {
    _weatherService = WeatherService();
    _locationService = LocationService();
  }

  Weather? get currentWeather => _currentWeather;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getWeatherForCity(String cityName) async {
    _setLoading(true);
    _errorMessage = null;

    try {
      final weather = await _weatherService.getWeatherByCity(cityName);
      _currentWeather = weather;
    } catch (e) {
      _errorMessage = e.toString();
      _currentWeather = null;
    }

    _setLoading(false);
  }

  Future<void> getWeatherForLocation(double lat, double lon) async {
    _setLoading(true);
    _errorMessage = null;

    try {
      final weather = await _weatherService.getWeatherByCoordinates(lat, lon);
      _currentWeather = weather;
    } catch (e) {
      _errorMessage = e.toString();
      _currentWeather = null;
    }

    _setLoading(false);
  }

  Future<void> getWeatherForCurrentLocation() async {
    _setLoading(true);
    _errorMessage = null;

    try {
      final position = await _locationService.getCurrentLocation();
      if (position != null) {
        final weather = await _weatherService.getWeatherByCoordinates(
          position.latitude,
          position.longitude
        );
        _currentWeather = weather;
      } else {
        throw Exception('لم أستطع الحصول على موقعك');
      }
    } catch (e) {
      _errorMessage = e.toString();
      _currentWeather = null;
    }

    _setLoading(false);
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
