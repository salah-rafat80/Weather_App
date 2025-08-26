import 'package:flutter/material.dart';

class SuggestionsListWidget extends StatelessWidget {
  final List<String> suggestions;
  final Color accentColor;
  final Function(String) onCitySelected;

  const SuggestionsListWidget({
    super.key,
    required this.suggestions,
    required this.accentColor,
    required this.onCitySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: accentColor.withOpacity(0.3), width: 1),
      ),
      child: Column(
        children: suggestions.map((city) {
          return ListTile(
            dense: true,
            leading: Icon(Icons.location_city, color: accentColor, size: 20),
            title: Text(
              city,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            onTap: () => onCitySelected(city),
          );
        }).toList(),
      ),
    );
  }
}
