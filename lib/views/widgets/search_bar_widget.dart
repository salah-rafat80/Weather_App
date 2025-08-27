import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/controllers/weather_controller.dart';
import '/models/weather_model.dart';
import '/data/city_data.dart';
import 'search_field_widget.dart';
import 'suggestions_list_widget.dart';

class SearchBarWidget extends StatefulWidget {
  final WeatherTheme? weatherTheme;

  const SearchBarWidget({super.key, this.weatherTheme});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showSuggestions = false;
  List<String> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text;
    setState(() {
      _filteredSuggestions = CityData.filterCities(query);
      _showSuggestions = _focusNode.hasFocus && _filteredSuggestions.isNotEmpty;
    });
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      _onSearchChanged();
    } else {
      setState(() {
        _showSuggestions = false;
      });
    }
  }

  void _searchWeather() {
    final cityName = _searchController.text.trim();
    if (cityName.isNotEmpty) {
      context.read<WeatherController>().getWeatherForCity(cityName);
      _focusNode.unfocus();
    }
  }

  void _getCurrentLocationWeather() {
    context.read<WeatherController>().getWeatherForCurrentLocation();
    _focusNode.unfocus();
  }

  void _selectSuggestion(String cityName) {
    _searchController.text = cityName;
    _focusNode.unfocus();
    context.read<WeatherController>().getWeatherForCity(cityName);
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.weatherTheme;
    final accentColor = theme?.accentColor ?? Color(0xFF64B5F6);
    final primaryColor = theme?.primaryColor ?? Color(0xFF4682B4);

    return Column(
      children: [
        SearchFieldWidget(
          controller: _searchController,
          focusNode: _focusNode,
          accentColor: accentColor,
          primaryColor: primaryColor,
          onSearch: _searchWeather,
          onLocationPressed: _getCurrentLocationWeather,
          onSubmitted: _searchWeather,
        ),
        if (_showSuggestions)
          SuggestionsListWidget(
            suggestions: _filteredSuggestions,
            accentColor: accentColor,
            onCitySelected: _selectSuggestion,
          ),
      ],
    );
  }
}
